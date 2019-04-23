$(document).ready(function() {
    $('#team-players').DataTable({
    "paging": false
  })
  
  var players = ["DeMarre Carroll",
 "Allen Crabbe",
 "Caris LeVert",
 "Jared Dudley",
 "Spencer Dinwiddie",
 "Jarrett Allen",
 "Dzanan Musa",
 "Rodions Kurucs",
 "Shabazz Napier",
 "Ed Davis",
 "Joe Harris",
 "Treveon Graham",
 "Theo Pinson",
 "Alan Williams",
 "Michael Kidd-Gilchrist",
 "Kemba Walker",
 "Cody Zeller",
 "Jeremy Lamb",
 "Frank Kaminsky",
 "Nicolas Batum",
 "Bismack Biyombo",
 "Marvin Williams",
 "Willy Hernangomez",
 "Malik Monk",
 "Dwayne Bacon",
 "Miles Bridges",
 "J.P. Macura",
 "Devonte' Graham",
 "Tony Parker",
 "Shelvin Mack",
 "Joe Chealey",
 "Robin Lopez",
 "Timothe Luwawu-Cabarrot",
 "Denzel Valentine",
 "Kris Dunn",
 "Lauri Markkanen",
 "Cristiano Felicio",
 "Otto Porter",
 "Wayne Selden",
 "Chandler Hutchison",
 "Wendell Carter Jr.",
 "Zach LaVine",
 "Antonio Blakeney",
 "Ryan Arcidiacono",
 "Rawle Alkins",
 "Shaquille Harrison",
 "Brandon Sampson",
 "Walt Lemon Jr.",
 "John Henson",
 "Larry Nance Jr.",
 "Brandon Knight",
 "Kevin Love",
 "Tristan Thompson",
 "Wenyen Gabriel",
 "Jordan Clarkson",
 "Matthew Dellavedova",
 "Marquese Chriss",
 "J.R. Smith",
 "Ante Zizic",
 "Cedi Osman",
 "Collin Sexton",
 "Channing Frye",
 "David Nwaba",
 "Jaron Blossomgame",
 "Deng Adel",
 "Nik Stauskas",
 "Kristaps Porzingis",
 "J.J. Barea",
 "Dwight Powell",
 "Dorian Finney-Smith",
 "Courtney Lee",
 "Justin Jackson",
 "Tim Hardaway Jr.",
 "Maxi Kleber",
 "Trey Burke",
 "Luka Doncic",
 "Ryan Broekhoff",
 "Kostas Antetokounmpo",
 "Jalen Brunson",
 "Dirk Nowitzki",
 "Daryl Macon",
 "Devin Harris",
 "Trey Lyles",
 "Malik Beasley",
 "Jamal Murray",
 "Troy Williams",
 "Corey Brewer",
 "B.J. Johnson",
 "LaMarcus Aldridge",
 "Dejounte Murray",
 "DeMar DeRozan",
 "Jakob Poeltl",
 "Derrick White",
 "Patty Mills",
 "Rudy Gay",
 "Davis Bertans",
 "Lonnie Walker",
 "Dante Cunningham",
 "Marco Belinelli",
 "Bryn Forbes",
 "Quincy Pondexter",
 "Chimezie Metu",
 "Drew Eubanks",
 "Ben Moore",
 "Donatas Motiejunas",
 "Marc Gasol",
 "Kawhi Leonard",
 "Danny Green",
 "Norman Powell",
 "Juan Hernangomez",
 "Tyler Lydon",
 "Paul Millsap",
 "Mason Plumlee",
 "Gary Harris",
 "Michael Porter Jr.",
 "Torrey Craig",
 "Nikola Jokic",
 "Will Barton",
 "Jarred Vanderbilt",
 "Isaiah Thomas",
 "Thomas Welsh",
 "Monte Morris",
 "Brandon Goodwin",
 "Reggie Jackson",
 "Jon Leuer",
 "Ish Smith",
 "Andre Drummond",
 "Thon Maker",
 "Luke Kennard",
 "Langston Galloway",
 "Blake Griffin",
 "Bruce Brown",
 "Glenn Robinson III",
 "Jose Calderon",
 "Sviatoslav Mykhailiuk",
 "Zaza Pachulia",
 "Khyri Thomas",
 "Kalin Lucas",
 "Isaiah Whitehead",
 "Wayne Ellington",
 "Klay Thompson",
 "Draymond Green",
 "Damian Jones",
 "Jordan Bell",
 "Stephen Curry",
 "Andre Iguodala",
 "Shaun Livingston",
 "Quinn Cook",
 "Jacob Evans",
 "DeMarcus Cousins",
 "Kevin Durant",
 "Kevon Looney",
 "Jonas Jerebko",
 "Damion Lee",
 "Marcus Derrickson",
 "Alfonzo McKinnie",
 "Andrew Bogut",
 "James Harden",
 "Iman Shumpert",
 "Eric Gordon",
 "Nene ",
 "P.J. Tucker",
 "Chris Paul",
 "Gerald Green",
 "Trevon Duval",
 "Isaiah Hartenstein",
 "Clint Capela",
 "Gary Clark",
 "Vince Edwards",
 "Danuel House",
 "Austin Rivers",
 "Kenneth Faried",
 "Chris Chiozza",
 "Michael Frazier",
 "Victor Oladipo",
 "Myles Turner",
 "Thaddeus Young",
 "Cory Joseph",
 "Domantas Sabonis",
 "T.J. Leaf",
 "Bojan Bogdanovic",
 "Darren Collison",
 "Edmond Sumner",
 "Aaron Holiday",
 "Tyreke Evans",
 "Doug McDermott",
 "Kyle O'Quinn",
 "Alize Johnson",
 "Davon Reed",
 "Pascal Siakam",
 "OG Anunoby",
 "Kyle Lowry",
 "Serge Ibaka",
 "Fred VanVleet",
 "Chris Boucher",
 "Jordan Loyd",
 "Patrick McCaw",
 "Malcolm Miller",
 "Jeremy Lin",
 "Jodie Meeks",
 "Eric Moreland",
 "Rudy Gobert",
 "Ricky Rubio",
 "Jae Crowder",
 "Donovan Mitchell",
 "Tony Bradley",
 "Kyle Korver",
 "Thabo Sefolosha",
 "Royce O'Neale",
 "Ekpe Udoh",
 "Joe Ingles",
 "Wesley Matthews",
 "Wilson Chandler",
 "Patrick Beverley",
 "Lou Williams",
 "Ivica Zubac",
 "Garrett Temple",
 "Rodney McGruder",
 "Danilo Gallinari",
 "Sindarius Thornwell",
 "JaMychal Green",
 "Johnathan Motley",
 "Shai Gilgeous-Alexander",
 "Landry Shamet",
 "Jerome Robinson",
 "Angel Delgado",
 "Montrezl Harrell",
 "Tyrone Wallace",
 "Brandon Ingram",
 "Lonzo Ball",
 "Kyle Kuzma",
 "Josh Hart",
 "Reggie Bullock",
 "Mike Muscala",
 "Moritz Wagner",
 "Isaac Bonga",
 "Kentavious Caldwell-Pope",
 "Rajon Rondo",
 "LeBron James",
 "Lance Stephenson",
 "JaVale McGee",
 "Alex Caruso",
 "Johnathan Williams",
 "Tyson Chandler",
 "Jemerrio Jones",
 "Jonas Valanciunas",
 "Delon Wright",
 "Chandler Parsons",
 "Mike Conley",
 "Justin Holiday",
 "Tyler Dorsey",
 "C.J. Miles",
 "Dillon Brooks",
 "Ivan Rabb",
 "Jaren Jackson Jr.",
 "Avery Bradley",
 "Kyle Anderson",
 "Jevon Carter",
 "Yuta Watanabe",
 "Joakim Noah",
 "Julian Washburn",
 "Bruno Caboclo",
 "Tyler Zeller",
 "Justise Winslow",
 "Goran Dragic",
 "Ryan Anderson",
 "Hassan Whiteside",
 "Bam Adebayo",
 "James Johnson",
 "Dion Waiters",
 "Kelly Olynyk",
 "Josh Richardson",
 "Derrick Jones Jr.",
 "Duncan Robinson",
 "Yante Maten",
 "Udonis Haslem",
 "Dwyane Wade",
 "Kendrick Nunn",
 "Eric Bledsoe",
 "Giannis Antetokounmpo",
 "Khris Middleton",
 "Malcolm Brogdon",
 "D.J. Wilson",
 "George Hill",
 "Sterling Brown",
 "Tony Snell",
 "Nikola Mirotic",
 "Donte DiVincenzo",
 "Grayson Allen",
 "Derrick Favors",
 "Dante Exum",
 "Raul Neto",
 "Georges Niang",
 "Naz Mitrou-Long",
 "Tyler Cavanaugh",
 "John Wall",
 "Sam Dekker",
 "Bobby Portis",
 "Ian Mahinmi",
 "Tomas Satoransky",
 "Bradley Beal",
 "Devin Robinson",
 "Troy Brown Jr.",
 "Trevor Ariza",
 "Jeff Green",
 "Dwight Howard",
 "Jabari Parker",
 "Thomas Bryant",
 "Jordan McRae",
 "Chasson Randle",
 "Tarik Phillip",
 "Ersan Ilyasova",
 "Brook Lopez",
 "Pat Connaughton",
 "Bonzie Colson",
 "Pau Gasol",
 "Tim Frazier",
 "Gorgui Dieng",
 "Andrew Wiggins",
 "Robert Covington",
 "Karl-Anthony Towns",
 "Tyus Jones",
 "Dario Saric",
 "Jerryd Bayless",
 "Jeff Teague",
 "Taj Gibson",
 "Josh Okogie",
 "Derrick Rose",
 "Jared Terrell",
 "Keita Bates-Diop",
 "Anthony Tolliver",
 "C.J. Williams",
 "Luol Deng",
 "Cameron Reynolds",
 "Mitch Creek",
 "Anthony Davis",
 "Stanley Johnson",
 "E'Twaun Moore",
 "Cheick Diallo",
 "Solomon Hill",
 "Jrue Holiday",
 "Frank Jackson",
 "Darius Miller",
 "Elfrid Payton",
 "Julius Randle",
 "Ian Clark",
 "Trevon Bluiett",
 "Kenrich Williams",
 "Jahlil Okafor",
 "Christian Wood",
 "Dairis Bertans",
 "Emmanuel Mudiay",
 "Lance Thomas",
 "Frank Ntilikina",
 "Dennis Smith Jr.",
 "Damyean Dotson",
 "Isaiah Hicks",
 "Kevin Knox",
 "Mario Hezonja",
 "DeAndre Jordan",
 "Luke Kornet",
 "Mitchell Robinson",
 "Allonzo Trier",
 "Noah Vonleh",
 "Kadeem Allen",
 "John Jenkins",
 "Henry Ellenson",
 "Billy Garrett",
 "Dennis Schroder",
 "Russell Westbrook",
 "Steven Adams",
 "Patrick Patterson",
 "Abdel Nader",
 "Andre Roberson",
 "Terrance Ferguson",
 "Nerlens Noel",
 "Paul George",
 "Deonte Burton",
 "Jerami Grant",
 "Raymond Felton",
 "Hamidou Diallo",
 "Donte Grantham",
 "Markieff Morris",
 "Jawun Evans",
 "Nikola Vucevic",
 "Terrence Ross",
 "Jerian Grant",
 "Jarell Martin",
 "Timofey Mozgov",
 "D.J. Augustin",
 "Evan Fournier",
 "Jonathan Isaac",
 "Markelle Fultz",
 "Wesley Iwundu",
 "Khem Birch",
 "Mohamed Bamba",
 "Melvin Frazier",
 "Aaron Gordon",
 "Troy Caupain",
 "Amile Jefferson",
 "Michael Carter-Williams",
 "Jimmy Butler",
 "Tobias Harris",
 "Ben Simmons",
 "Boban Marjanovic",
 "T.J. McConnell",
 "Furkan Korkmaz",
 "Jonathon Simmons",
 "Joel Embiid",
 "Zhaire Smith",
 "J.J. Redick",
 "Mike Scott",
 "James Ennis",
 "Amir Johnson",
 "Jonah Bolden",
 "Shake Milton",
 "Haywood Highsmith",
 "Greg Monroe",
 "T.J. Warren",
 "Devin Booker",
 "Kelly Oubre Jr.",
 "Richaun Holmes",
 "Tyler Johnson",
 "Troy Daniels",
 "Dragan Bender",
 "Josh Jackson",
 "Deandre Ayton",
 "Mikal Bridges",
 "George King",
 "Elie Okobo",
 "De'Anthony Melton",
 "Jamal Crawford",
 "Ray Spalding",
 "Jimmer Fredette",
 "Damian Lillard",
 "CJ McCollum",
 "Al-Farouq Aminu",
 "Evan Turner",
 "Jake Layman",
 "Meyers Leonard",
 "Skal Labissiere",
 "Maurice Harkless",
 "Zach Collins",
 "Anfernee Simons",
 "Jusuf Nurkic",
 "Gary Trent Jr.",
 "Seth Curry",
 "Rodney Hood",
 "Enes Kanter",
 "Alec Burks",
 "Willie Cauley-Stein",
 "Kosta Koufos",
 "Harrison Barnes",
 "Buddy Hield",
 "Caleb Swanigan",
 "Harry Giles",
 "Justin Anderson",
 "Kent Bazemore",
 "Taurean Prince",
 "DeAndre' Bembry",
 "Miles Plumlee",
 "John Collins",
 "Dewayne Dedmon",
 "Trae Young",
 "Kevin Huerter",
 "Omari Spellman",
 "Jaylen Adams",
 "Alex Len",
 "Alex Poythress",
 "Vince Carter",
 "Isaac Humphries",
 "Deyonta Davis",
 "Kyrie Irving",
 "Marcus Morris",
 "Terry Rozier",
 "Al Horford",
 "Jaylen Brown",
 "Jayson Tatum",
 "Gordon Hayward",
 "Semi Ojeleye",
 "Guerschon Yabusele",
 "Daniel Theis",
 "Brad Wanamaker",
 "Robert Williams",
 "Aron Baynes",
 "Marcus Smart",
 "PJ Dozier",
 "R.J. Hunter",
 "Jonathan Gibson",
 "D'Angelo Russell",
 "Rondae Hollis-Jefferson",
 "De'Aaron Fox",
 "Bogdan Bogdanovic",
 "Frank Mason III",
 "Marvin Bagley III",
 "Nemanja Bjelica",
 "Yogi Ferrell"];
  
  
  $('#name').autoComplete({
      minChars: 2,
      source: function(term, suggest){
          term = term.toLowerCase();
          var choices = players;
          var matches = [];
          for (i=0; i<choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      }
  });
  
   // Code for the player stats graph //
  
   
   const randomColor = function(  ) {
     return Math.floor(Math.random()*255)
   };
   
   const ctx = $('#myChart');
   
   const $playerData = $('.temp_info').data('temp')
   
   if ($playerData.length > 0){
     $('#chart').removeClass('hidden');
     $('#chart').addClass('graph');
   } else {
     $('#chart').addClass('hidden');
     $('#chart').removeClass('graph');
   };
   
   
   
   const graphData = function(  ) {
     const dataset = []
     
     for (let data of $playerData){
       dataset.push({
         label: data.first_name + data.last_name,
         data: [data.ppg, data.fgperc, data.efgperc, data.threepperc, data.ftperc, data.trb, data.apg, data.per, data.ws],
         backgroundColor: ["rgba(255,255,255,0)"],
         borderColor: [ 

             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`,
             `rgba(${randomColor()}, ${randomColor()}, ${randomColor()}, 1)`
             
         ],
         borderWidth: 3
         
       });
     }
     
     return dataset
     
   };
   
   var myChart = new Chart(ctx, {
    type: 'line',
    responsive: true,
    data: {
        labels: ['PPG', 'FG%', 'eFG%', '3P%', 'FT%', 'TRB', 'APG', 'PER', 'WS'],
        datasets: graphData()
    },
    
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
   
  
  
});
