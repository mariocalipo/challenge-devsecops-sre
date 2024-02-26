from google.cloud import bigquery

def bq_query(request):
    client = bigquery.Client()

    
    query = "SELECT * `challenge-devsecops-sre.latam_devops_dataset.latam_devops_table`"

    query_job = client.query(query)
    results = query_job.result()

    # Convert BigQuery results to a list of dictionaries
    data = [dict(row) for row in results]

    return data
