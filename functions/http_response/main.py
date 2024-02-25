from flask import jsonify
from bq_query import bq_query

def http_response(request):
    # Call the bigquery_query function to get data
    data = bq_query(request)

    # Customize the response format as needed
    response = {
        "status": "success",
        "data": data
    }

    return jsonify(response)
