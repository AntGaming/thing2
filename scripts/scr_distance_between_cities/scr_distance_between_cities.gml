// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function distance_between_cities(city1, city2) 
{
    var visited = array_create(array_length(global.city_info), false);
	var distance = array_create(array_length(global.city_info), infinity);

	array_set(distance, city1, 0);
	//distance[city1] = 0;

	while (true) {
	    var minDistance = infinity;
	    var currentNode = -1;

	    // Find the closest unvisited city
	    for (var i = 0; i < array_length(global.city_info); i++) {
	        if (!visited[i] && distance[i] < minDistance) {
	            minDistance = distance[i];
	            currentNode = i;
	        }
	    }

	    if (currentNode == -1) {
	        // No more unvisited cities
	        break;
	    }

	    visited[currentNode] = true;

	    // Update distances to neighboring cities
	    var connections = global.city_info[currentNode].connections;
	    for (var j = 0; j < array_length(connections); j++) {
	        var neighbor = connections[j];
	        var newDistance = distance[currentNode] + 1;
	        if (newDistance < distance[neighbor]) {
	            distance[neighbor] = newDistance;
	        }
	    }
	}

	return distance[city2];
}

/*
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function distance_between_cities(city1, city2) 
{
    if(city1 == city2) return 0;
	else if(array_contains(global.city_info[city1].connections, city2)) return 1;
	else return 2;
}
*/