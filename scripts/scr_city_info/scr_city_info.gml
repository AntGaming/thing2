global.city_info =	
[
	{
		name: "Ricciarello",
		connections: [6, 5, 4, 7]
	},
	{
		name: "Cannolo",
		connections: [5, 4, 3]
	},
	{
		name: "Pizzoccheri",
		connections: [6, 7, 8]
	},
	{
		name: "Taralli",
		connections: [1, 4]
	},
	{
		name: "Fregola",
		connections: [9, 7, 0, 5, 1, 3]
	},
	{
		name: "Cavatelli",
		connections: [0, 4, 1]
	},
	{
		name: "Suppli",
		connections: [2, 0]
	},
	{
		name: "Torrone",
		connections: [2, 6, 0, 4, 9, 8]
	},
	{
		name: "Zuppetta",
		connections: [2, 7, 9]
	},
	{
		name: "Strascinati",
		connections: [8, 7, 4]
	}
];

enum builds
{
	house,
	station,
	store,
	office,
	gunstore,
	hardwarestore,
	pizza,
	nightclub,
	train
}

global.names_builds =
[
	"house",
	"police station",
	"grocery store",
	"office",
	"gun store",
	"hardware store",
	"pizzeria",
	"nightclub",
	"train station"
];

enum jobs
{
	unemployed,
	police_officer,
	cashier,
	guard,
	boss,
	office_worker,
	chef,
	waiter,
	bartender,
	station_manager
}

global.names_jobs =
[
	"unemployed",
	"police officer",
	"cashier",
	"guard",
	"boss",
	"office worker",
	"chef",
	"waiter",
	"bartender",
	"station manager"
];

#macro CITY_SIDE 7

global.build_reqs =
[
	0, //house
	1, //station
	3, //store
	1, //office
	1, //gunstore
	2, //hardwarestore
	1, //pizza
	1, //nightclub
	1 //train
];
