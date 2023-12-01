// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shortest_path_between_cities(city1, city2) 
{
    var visited = array_create(array_length(global.city_info), false);
    var distance = array_create(array_length(global.city_info), infinity);
    var path = array_create(array_length(global.city_info), -1); // Initialize path array with -1

    distance[city1] = 0;

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
            var newDistance = distance[currentNode] + 1; // Assuming distance is always 1

            if (newDistance < distance[neighbor]) {
                distance[neighbor] = newDistance;
                path[neighbor] = currentNode; // Update the path to the neighbor
            }
        }
    }

    // Reconstruct the path
    var shortestPath = array_create(0);
    var currentCity = city2;

    while (currentCity != -1) {
        array_insert(shortestPath, 0, currentCity);
        currentCity = path[currentCity];
    }

    return shortestPath;
}
