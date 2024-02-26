from google.cloud import bigquery
from flask import Flask, jsonify

app = Flask(__name__)

def bq_query(request):
    client = bigquery.Client()

    query = "SELECT * FROM `challenge-devsecops-sre.latam_devops_dataset.latam_devops_table`"

    query_job = client.query(query)
    results = query_job.result()

    # Convert BigQuery results to a list of dictionaries
    data = [dict(row) for row in results]

    return data

@app.route('/')
def http_response(request):
    try:
        # Call the bq_query function to get data
        data = bq_query(request)

        # Customize the response format as needed
        response = {
            "status": "success",
            "data": data
        }

        return jsonify(response)
    except Exception as e:
        # Handle exceptions and return an error response
        error_response = {
            "status": "error",
            "message": str(e)
        }
        return jsonify(error_response), 500  # Return a 500 Internal Server Error status

if __name__ == "__main__":
    app.run(port=8080)
