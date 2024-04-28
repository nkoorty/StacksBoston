from flask import Flask, request, jsonify
import os
import subprocess

app = Flask(__name__)

@app.route('/test', methods=['GET'])
def get_request():
    dataJ = {
        'message': 'This is a JSON response!'
    }
    return get_nonce()

@app.route('/payment-initiate', methods=['POST'])
def iniate_payment_request():
    try:
        data = request.json 
        print(data)
        user_id = data["user-id"]
        total_purchase_amount = data["total-purchase-amount"]
        down_payment = data["down-payment"]
        number_of_instalments = data["number-of-instalments"]
        instalment_amount = data["instalment-amount"]
        blocks_per_instalment = data["blocks-per-instalment"]
        stx_command = f'stx call_contract_func ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5 payment initiate-payment-plan 1000 {get_nonce()} 7287ba251d44a4d3fd9276c88ce34c5c52a038955511cccaf77e61068649c17801 -I "http://localhost:3999" -t'
        # Start the process
        process = subprocess.Popen(["bash", "-c", stx_command], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Prepare the input data with newline characters to simulate pressing "Enter" after each input
        input_data = f"{user_id}\n{total_purchase_amount}\n{down_payment}\n{number_of_instalments}\n{instalment_amount}\n{blocks_per_instalment}"

        # Send the input data and collect the output
        stdout_data, stderr_data = process.communicate(input=input_data)

        print("STDOUT:", stdout_data)
        print("STDERR:", stderr_data)

        return jsonify({"data": f"{stdout_data}", "error": f"{stderr_data}"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/make-payment', methods=['POST'])
def make_payment():
    try:
        
        data = request.json 
        print(data)
        plan_id = data["plan-id"]
        amount = data["amount"]
        stx_command = f'stx call_contract_func ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5 payment make-payment 1000 14 7287ba251d44a4d3fd9276c88ce34c5c52a038955511cccaf77e61068649c17801 -I "http://localhost:3999" -t'
        # Start the process
        process = subprocess.Popen(["bash", "-c", stx_command], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Prepare the input data with newline characters to simulate pressing "Enter" after each input
        input_data = f"{plan_id}\n{amount}"

        # Send the input data and collect the output
        stdout_data, stderr_data = process.communicate(input=input_data)


        print("STDOUT:", stdout_data)
        print("STDERR:", stderr_data)
        
        return jsonify({"data": f"{stdout_data}", "error": f"{stderr_data}"})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


def get_nonce():
    command = ["bash", "scripts/nonce.sh"]
    nonce = subprocess.run(command, stdout=subprocess.PIPE, text=True)
    output = nonce.stdout.strip()
    print("The output of the Bash script is:", output)
    return output

if __name__ == '__main__':
    app.run(debug=True)