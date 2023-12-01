global.taken_names = [];

gro_titles = [
"*'s",
"*'s Produce",
"*'s Fresh Produce",
"* & Son",
"* & Co.",
"* Grocery Store",
"* Groceries"
];

piz_titles = [
"*'s",
"*'s Pizzeria",
"*'s Pizza",
"* Pizzeria & Grill",
"* Villa",
"*'s Pizza Villa",
"*'s Pizza",
"*'s Pizza House",
"*'s Kitchen",
"Ristorante *",
"Villa *",
"Casa *",
"Pizza de *",
"Trattoria *"
];

gun_titles = [
"* Firearms",
"* Guns",
"* Pistols",
"* Gun Store",
"* Armaments",
"* Weaponry"
];

hardware_titles = [
"* DIY",
"* Supplies",
"* Equipment",
"* Home Improvement",
"* Hardware",
"* Hardware Store"
];

hide_adjectives = ["Secret", "Hidden", "Covert", "Illicit", "Clandestine", "Shady", "Underground", "Furtive", "Disguised", "Concealed", "Secluded", "Remote", "Inaccessible", "Desolate", "Abandoned", "Forgotten", "Isolated", "Fortified", "Impregnable", "Devious", "Unlawful", "Sinister", "Shadowy", "Unseen", "Mysterious", "Forbidden", "Nefarious", "Suspicious", "Obscure", "Notorious"]
hide_nouns = ["Lair", "Hideaway", "Den", "Stronghold", "Bastion", "Sanctuary", "Refuge", "Retreat", "Fortress", "Vault", "Bunker", "Haven", "Nexus", "Dungeon", "Conclave"]

tower_names = ["Aquila", "Astore", "Asino", "Bisonte", "Bufalo", "Cane", "Capra", "Cavallo", "Cervo", "Cinghiale", "Cobra", "Corvo", "Daino", "Drago", "Falco", "Faina", "Falcone", "Faraona", "Gabbiano", "Gatto", "Ghepardo", "Giraffa", "Granchio", "Iena", "Lince", "Leone", "Leopardo", "Lumaca", "Lupo", "Martora", "Mucca", "Orso", "Oroscopo", "Pantera", "Pavone", "Pecora", "Pellicano", "Pinguino", "Pollo", "Procione", "Rana", "Rondine", "Salmone", "Scoiattolo", "Serpente", "Tartaruga", "Tigre", "Tonno", "Uccello", "Volpe", "Azzurro", "Bianco", "Blu", "Bronzo", "Camoscio", "Carminio", "Ciano", "Cipria", "Crema", "Dorato", "Fango", "Ferrite", "Giallo", "Grigio", "Indaco", "Lilla", "Magenta", "Marrone", "Nero", "Oro", "Ottone", "Panna", "Porpora", "Prugna", "Rame", "Rosa", "Rosso", "Ruggine", "Salvia", "Salmone", "Smeraldo", "Talpa", "Turchese", "Ultramarino", "Verde", "Viola", "Zaffiro", "Zinco", "Ambra", "Argento", "Beige", "Cenere", "Cioccolato", "Granata", "Kaki", "Lavanda", "Pesca", "Pistacchio", "Rosato", "Tabacco", "Alba", "Alessandria", "Ancona", "Bari", "Bologna", "Brescia", "Cagliari", "Catania", "Como", "Ferrara", "Firenze", "Genova", "Lecce", "Livorno", "Mantova", "Messina", "Milano", "Modena", "Napoli", "Novara", "Padova", "Palermo", "Parma", "Perugia", "Pescara", "Piacenza", "Pisa", "Ravenna", "Reggio Calabria", "Rimini", "Roma", "Salerno", "Savona", "Siena", "Siracusa", "Taranto", "Terni", "Torino", "Treviso", "Trieste", "Udine", "Varese", "Venezia", "Verona", "Vicenza", "Viterbo", "Zara", "Alighieri", "Botticelli", "Boccaccio", "Borromini", "Caravaggio", "Carracci", "Castiglione", "Cellini", "Dante", "Da Vinci", "Donatello", "Fellini", "Galilei", "Giotto", "Leoncavallo", "Leonardo", "Lorenzo", "Machiavelli", "Manzoni", "Marconi", "Michelangelo", "Modigliani", "Monteverdi", "Morricone", "Petrarch", "Puccini", "Raffaello", "Rossini", "Savonarola", "Scarlatti", "Sforza", "Tintoretto", "Tiziano", "Verdi", "Vivaldi", "Volta", "Zanotti", "Alberti", "Amati", "Baracchi", "Barberini", "Belli", "Borgese", "Botticino", "Capponi", "Cavalli", "Colombo", "Correggio", "Costa", "Galilei", "Garibaldi", "Mussolini", "Pucci", "Animan"];

street_names = ["Via Roma", "Via Garibaldi", "Via Dante", "Corso Vittorio Emanuele", "Corso Italia", "Via Veneto", "Via Milano", "Via Leonardo da Vinci", "Via Montenapoleone", "Via della Repubblica", "Via del Corso", "Via XX Settembre", "Corso Buenos Aires", "Via dei Condotti", "Via San Gregorio", "Via dei Fori Imperiali", "Via San Carlo", "Via della Moscova", "Via Cavour", "Via della Liberta", "Via Mazzini", "Via dei Giardini", "Corso Duomo", "Via della Scala", "Via San Babila", "Via delle Muratte", "Via Santa Margherita", "Via della Croce", "Via dei Coronari", "Via dei Serpenti", "Via Giulia", "Via del Babuino", "Corso Magenta", "Via della Consolata", "Via Roma", "Via Po", "Corso Vittorio Emanuele II", "Via Garibaldi", "Via Venti Settembre", "Via XX Settembre", "Via Pietro Micca", "Corso Cairoli", "Via Accademia Albertina", "Via Nizza", "Corso Duca degli Abruzzi", "Via Roma", "Via Giuseppe Verdi", "Via Paolo Sarpi", "Corso Porta Nuova", "Via Torino", "Via Pietro Micca", "Corso Umberto I", "Via Solferino", "Via dei Mille", "Via San Marco", "Via Merulana", "Via Nazionale", "Via Labicana", "Via Tiburtina", "Corso Vittorio Emanuele Orlando", "Via Flaminia", "Via Veneto", "Via dei Fori Imperiali", "Via Appia Nuova", "Via Cassia", "Via Salaria", "Via Tiburtina", "Via Cristoforo Colombo", "Via Ostiense", "Via Tuscolana", "Via Nomentana", "Via Aurelia", "Via della Conciliazione", "Via della Lungara", "Via della Scrofa", "Via del Corso", "Via dei Fori Imperiali", "Via dei Cerchi"];

pol_names = ["Central", "Downtown", "Uptown", "City"];
pol_ends = ["Police Department"];

first_names_m = ["Diavolo", "Giorno", "Narancia", "Leone", "Luca", "Leonardo", "Gabriel", "Matteo", "Lorenzo", "Francesco", "Alessandro", "Leon", "Emanuele", "Mattia", "Riccardo", "Filippo", "Tommaso", "Giacomo", "Davide", "Federico", "Marco", "Simone", "Nicola", "Antonio", "Christian", "Samuele", "Edoardo", "Daniele", "Raffaele", "Giovanni", "Riccardo", "Andrea", "Stefano", "Alessio", "Gianluca", "Giacomo", "Emanuele", "Luigi", "Dario", "Roberto", "Mirko", "Michele", "Angelo", "Domenico", "Salvatore", "Enrico", "Maurizio", "Cristiano", "Claudio", "Massimo", "Giuseppe", "Paolo", "Pasquale", "Pierluigi", "Vincenzo", "Bruno", "Giancarlo", "Giorgio", "Mario", "Sandro", "Luciano", "Federico", "Dario", "Ivan", "Davide", "Raffaele", "Lorenzo", "Valerio", "Cesare", "Diego", "Rocco", "Renato", "Alessandro", "Nicola", "Alberto", "Guglielmo", "Flavio", "Stefano", "Tiziano", "Mauro", "Alessio", "Antonio", "Giovanni", "Fabio", "Giulio", "Eugenio", "Ludovico", "Samuele", "Enzo", "Pietro", "Armando", "Giorgio", "Fabrizio", "Gianfranco", "Gino", "Emilio", "Pasquale", "Marcello", "Vittorio", "Filippo", "Sergio", "Ugo", "Carlo", "Riccardo", "Piero", "Guido", "Roberto", "Andrea", "Luca", "Giuseppe", "Massimiliano", "Leonardo", "Rocco", "Antonio", "Gianluca", "Alberto", "Francesco", "Simone", "Alessio", "Davide", "Marco", "Gabriele", "Mattia", "Stefano", "Samuele", "Matteo", "Riccardo", "Cristian", "Fabio", "Michele", "Daniele", "Giovanni", "Angelo", "Enrico", "Pietro", "Federico", "Emanuele", "Roberto", "Nicola", "Tommaso", "Raffaele", "Giorgio", "Giacomo", "Dario", "Claudio", "Alessandro", "Salvatore", "Luciano", "Mauro", "Lorenzo", "Filippo", "Domenico", "Diego", "Gino", "Fabrizio", "Giulio", "Leonardo", "Luciano", "Michele", "Angelo", "Salvatore", "Roberto", "Riccardo", "Antonio", "Benito", "Bemon", "Bo", "Hue", "Malleo", "Lona", "Duxelles", "Sim", "Oven", "Omino", "Sanador"];
first_names_f = ["Giulia", "Sofia", "Aurora", "Alice", "Emma", "Greta", "Giorgia", "Martina", "Chiara", "Beatrice", "Francesca", "Viola", "Elena", "Ludovica", "Camilla", "Matilde", "Alessia", "Elisa", "Eleonora", "Clara", "Vittoria", "Bianca", "Nicole", "Valentina", "Noemi", "Asia", "Serena", "Margherita", "Federica", "Carlotta", "Giada", "Silvia", "Caterina", "Linda", "Rebecca", "Giovanna", "Maria", "Luisa", "Isabella", "Lara", "Erika", "Paola", "Erica", "Laura", "Marta", "Sabrina", "Gabriella", "Roberta", "Daniela", "Alice", "Francesca", "Sara", "Miriam", "Anna", "Veronica", "Cristina", "Valeria", "Monica", "Elisabetta", "Stefania", "Rosa", "Angela", "Gloria", "Marina", "Maddalena", "Simona", "Emanuela", "Sabina", "Alessandra", "Raffaella", "Letizia", "Lucia", "Tiziana", "Nadia", "Federica", "Antonella", "Eleonora", "Clara", "Elisa", "Paola", "Laura", "Angela", "Vittoria", "Sara", "Martina", "Giovanna", "Beatrice", "Camilla", "Alice", "Valentina", "Giulia", "Francesca", "Aurora", "Ludovica", "Simona", "Chiara", "Elena", "Silvia", "Rebecca", "Nicole", "Serena", "Caterina", "Rosa", "Monica", "Bianca", "Elisabetta", "Isabella", "Maria", "Marta", "Margherita", "Greta", "Alessia", "Veronica", "Sabrina", "Erica", "Giorgia", "Clara", "Sofia", "Valentina", "Alice", "Emma", "Greta", "Giulia", "Martina", "Beatrice", "Francesca", "Chiara", "Aurora", "Ludovica", "Elena", "Camilla", "Viola", "Elisa", "Matilde", "Alessia", "Giada", "Clara", "Bianca", "Giovanna", "Nicole", "Valeria", "Noemi", "Asia", "Serena", "Margherita", "Federica", "Carlotta", "Giorgia", "Silvia", "Caterina", "Linda", "Rebecca", "Greta", "Giovanna", "Sofia", "Aurora", "Alice", "Emma", "Giulia", "Giorgia", "Martina", "Chiara", "Beatrice", "Francesca", "Viola", "Elena", "Ludovica", "Camilla", "Matilde", "Alessia", "Elisa", "Eleonora", "Gentii"];
sur_names = ["Lo Presti", "Giovanna", "Buccellati", "Ghirga", "Abbachio", "Fugo", "Doppio", "Rossi", "Russo", "Ferrari", "Esposito", "Bianchi", "Romano", "Colombo", "Ricci", "Marino", "Greco", "Bruno", "Gallo", "Conti", "De Luca", "Mancini", "Costa", "Giordano", "Rizzo", "Lombardi", "Moretti", "Barbieri", "Fontana", "Santoro", "Mariani", "Rinaldi", "Caruso", "Ferrara", "Galli", "Martini", "Leone", "Longo", "Gentile", "Martinelli", "Messina", "Serra", "De Santis", "Valentini", "Ferri", "Fabbri", "Bianco", "Marini", "Grasso", "Monti", "De Angelis", "Riva", "Donati", "Pellegrini", "Palumbo", "D'Amico", "Giuliani", "Mazza", "Rossetti", "Orlando", "Palmieri", "Caputo", "Cattaneo", "Ferraro", "Parisi", "Sorrentino", "Silvestri", "Lombardo", "Farina", "Ruggiero", "Sala", "Costantini", "Bernardi", "Villa", "D'Angelo", "Marchesi", "Marini", "Piras", "Fiore", "Costanzo", "Negri", "Gatti", "Colombo", "Conte", "Lupo", "De Rosa", "Grassi", "Coppola", "Benedetti", "D'Angelo", "Rinaldi", "Barone", "Marchetti", "D'Amico", "Pellegrino", "Lupo", "Greco", "Parisi", "Piazza", "Russo", "D'Angelo", "Farina", "Palmieri", "Grasso", "Negri", "Bianchi", "Giordano", "Gentile", "Longo", "Marino", "Fabbri", "Ruggiero", "Fontana", "Ferrara", "D'Amico", "Ferraro", "Silvestri", "Serra", "Montanari", "Palumbo", "Rossetti", "De Santis", "Marini", "Romano", "Rizzi", "Mazza", "Russo", "Bruno", "Piras", "Orlando", "Lombardo", "Cattaneo", "Gallo", "Fiore", "Moretti", "Conte", "Costa", "Caruso", "Ricci", "Monti", "Mariani", "Santoro", "Vitali", "Ferri", "Bernardi", "Villa", "D'Amico", "Battaglia", "D'Angelo", "Gallo", "Lupo", "D'Amico", "Pellegrino", "Lupo", "Greco", "Parisi", "Piazza", "Russo", "D'Angelo", "Farina", "Palmieri", "Grasso", "Negri", "Bianchi", "Giordano", "Gentile"];
city_names = [ "Altovino", "Amarone", "Anziole", "Armena", "Basilona", "Biancavilla", "Borgona", "Bricenzo", "Brindisa", "Calderona",    "Campogrosso", "Carmagnola", "Castellum", "Cavalcorso", "Ceramica", "Cingoli", "Cittadella", "Cividale", "Colonnara",    "Comisso", "Cordevola", "Corviale", "Cusano", "Diamante", "Dolcedo", "Empoli", "Falciano", "Ficuzza", "Fossombrone",    "Frigento", "Gallina", "Genga", "Gonnos", "Gravellona", "Grezzana", "Itri", "Lavagna", "Lazzaretto", "Lercara",    "Limosano", "Lonigo", "Magenta", "Magione", "Mantova", "Marzamemi", "Melazzo", "Militello", "Misano", "Modena",    "Monsummano", "Montalcino", "Montevarchi", "Nardo", "Nocera", "Noto", "Novellara", "Orsogna", "Osimo", "Pallanza",    "Panzano", "Paratico", "Pavullo", "Pescantina", "Pezzana", "Piazza", "Poggibonsi", "Polla", "Polverara", "Pontinia",    "Porcari", "Portogruaro", "Precenicco", "Purano", "Ravascletto", "Reana", "Rignano", "Riola", "Roseto", "Rubiera",    "Rufina", "Sala", "Salsomaggiore", "Sansepolcro", "Saronno", "Savogna", "Savona", "Scafa", "Sesto", "Sora",    "Soveria", "Spadafora", "Spilimbergo", "Tarsia", "Tivoli", "Tolmezzo", "Torrazzo", "Trabia", "Trasacco", "Varese",    "Vieste", "Villafranca", "Villanova", "Volterra", "Zogno", "Gaming"];

function generate_person_name(type, gender)
{
	if(type == 0)
	{
		if(gender == 0)
		{
			return(first_names_m[irandom(array_length(first_names_m) - 1)]);
		}
		else
		{
			return(first_names_f[irandom(array_length(first_names_f) - 1)]);
		}
		
	}
	else
	{
		return(sur_names[irandom(array_length(sur_names) - 1)]);
	}
}

function generate_residence_name()
{
	return(string(irandom_range(1, 99)) + " " + street_names[irandom(array_length(street_names) - 1)]);
}

function generate_grocery_name()
{
	var grocery = sur_names[irandom(array_length(sur_names) - 1)];
	var title = gro_titles[irandom(array_length(gro_titles) - 1)];
	return(string_replace(title, "*", grocery));
}

function generate_pizza_name()
{
	var pizzeria = sur_names[irandom(array_length(sur_names) - 1)];
	var title = piz_titles[irandom(array_length(piz_titles) - 1)];
	return(string_replace(title, "*", pizzeria));
}

function generate_ff_name()
{
	var ff = tower_names[irandom(array_length(tower_names) - 1)];
	var title = ff_titles[irandom(array_length(ff_titles) - 1)];
	return(string_replace(title, "*", ff));
}

function generate_hide_name()
{
	var adj = hide_adjectives[irandom(array_length(hide_adjectives) - 1)];
	var noun = hide_nouns[irandom(array_length(hide_nouns) - 1)];
	return("The " + adj + " " + noun);
}

function generate_tower_name()
{
	var name = choose("Casa", "Rezidenza", "Palazzo");
	if(irandom(1) == 0)
	{
		name += " " + sur_names[irandom(array_length(sur_names) - 1)];
	}
	else
	{
		name += " " + tower_names[irandom(array_length(tower_names) - 1)];
	}
	return name;
}

function generate_office_name()
{
	var name = choose("Palazzo", "Ufficio");
	name += " " + tower_names[irandom(array_length(tower_names) - 1)];	
	return name;
}

function generate_pol_name(name)
{
	return(name + " " + pol_names[irandom(array_length(pol_names) - 1)] + " " + pol_ends[irandom(array_length(pol_ends) - 1)]);
}

function generate_hosp_name()
{
	return(tower_names[irandom(array_length(tower_names) - 1)] + " " + hosp_ends[irandom(array_length(hosp_ends) - 1)]);
}

function generate_city_name()
{
	return(city_names[irandom(array_length(city_names) - 1)]);
}