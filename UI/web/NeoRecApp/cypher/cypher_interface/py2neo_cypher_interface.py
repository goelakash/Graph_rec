from common import craft_cypher_command
from py2neo import *
from paths import *

authenticate("localhost:7474", "neo4j", "akash")
graph = Graph("http://localhost:7474/db/data/")

def execute_py2neo(cypher_script_name, *args):
    cypher_command = craft_cypher_command(cypher_script_name, *args)
    return graph.cypher.execute(cypher_command)


# input -> (userID)
def is_userID_present(*args):
    script_name = "is_userID_present.cql"
    output = execute_py2neo(script_name, *args)
    return bool(output[0][0])

# input -> (movieID)
def is_movieID_present(*args):
    script_name = "is_movieID_present.cql"
    output = execute_py2neo(script_name, *args)
    return bool(output[0][0])

# input -> NULL
def show_movies(*args):
    script_name = "show_movies.cql"
    output = execute_py2neo(script_name, *args)
    return output

# input -> (userID)
def show_ratings(*args):
    script_name = "show_ratings.cql"
    output = execute_py2neo(script_name, *args)
    return output

# input -> (userID, movieID, rating)
def update_rating(*args):
    script_name = "update_rating.cql"
    output = execute_py2neo(script_name, *args)
    return output

# input -> (userID)
def compute_similarity(*args):
    script_name = "compute_pearson_sim.cql"
    output = execute_py2neo(script_name, *args)
    return output


# input -> (userID)
def get_recommendations(*args):
    script_name = "get_recommendations.cql"
    output = execute_py2neo(script_name, *args)
    return output

# input -> (userID)
def get_recommendations_by_movieID(*args):
    script_name = "get_recommendations_by_movieID.cql"
    output = execute_py2neo(script_name, *args)
    return output

# input -> NULL
def get_userID_list(*args):
    script_name = "get_userID_list.cql"
    output = execute_py2neo(script_name, *args)
    return output

def user_avg_rating(*args):
    script_name = "user_avg_rating.cql"
    execute_py2neo(script_name,*args)