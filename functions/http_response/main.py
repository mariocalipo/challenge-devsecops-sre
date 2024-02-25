from flask import jsonify
from bq_query import bq_query

def http_response():
    try:
        # Call the bigquery_query function to get data
        data = bq_query()

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
