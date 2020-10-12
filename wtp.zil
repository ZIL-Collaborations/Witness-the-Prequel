"W I T N E S S :   T H E   P R E Q U E L "

"THE PROJECT"

<CONSTANT GAME-TITLE "Witness: The Prequel">
<CONSTANT GAME-DESCRIPTION
"A mystery story by Friends of ZILF">

<CONSTANT RELEASEID 1> <VERSION ZIP TIME>


"THE MECHANICS"

"Startup"

<ROUTINE GO ()
    <SET-THE-SCENE>
    <INTRODUCE-THE-GAME>
    <MAIN-LOOP>
>


"Library and Extensions"

<INSERT-FILE "parser">


"Game Specific Interaction"

"Game Specific Behaviour"

"Extra Game Verbs"

"Library Hooks"


"THE GAME"

"Setting the Scene"

<ROUTINE SET-THE-SCENE ()
    <SETG SCORE 20>
    <SETG HERE WORKSHOP>
    <MOVE PLAYER ,HERE>
>


"Introduction"

<ROUTINE INTRODUCE-THE-GAME ()
    <TELL CR CR "This game needs an introduction ..." CR>
    <CRLF> <V-VERSION>
    <CRLF> <V-LOOK>
>


"Cast"


"Setting"

<OBJECT HOUSE (DESC "house") (IN LOCAL-GLOBALS)
    (SYNONYM HOUSE)
    (ADJECTIVE LINDER)
    ;(ACTION HOUSE-F)
>

<OBJECT DINING-DOOR (DESC "french door") (IN LOCAL-GLOBALS)
    (ADJECTIVE DINING ROOM FRENCH)
    (SYNONYM DOOR LOCK)
    ;(GENERIC LOCKED-F)
    (FLAGS DOORBIT LOCKEDBIT)
>

<OBJECT KITCHEN-WINDOW (DESC "kitchen window") (IN LOCAL-GLOBALS)
    (ADJECTIVE KITCHEN)
    (SYNONYM WINDOW PANE PANES FRAME)
    ;(ACTION WINDOW-F)
    ;(GENERIC GENERIC-WINDOW-F)
    (FLAGS NDESCBIT)
>

<OBJECT BUTLER-WINDOW (DESC "bedroom window") (IN LOCAL-GLOBALS)
    (SYNONYM WINDOW PANE PANES FRAME)
    (ADJECTIVE BUTLER HIS BEDROOM BED ROOM)
    ;(ACTION WINDOW-F)
    ;(GENERIC GENERIC-WINDOW-F)
    (FLAGS NDESCBIT)
>

<OBJECT FRONT-GATE (DESC "front gate") (IN LOCAL-GLOBALS)
    (ADJECTIVE FRONT)
    (SYNONYM GATE)
    (FLAGS DOORBIT)
>

<OBJECT FRONT-DOOR (DESC "front door") (IN LOCAL-GLOBALS)
    (ADJECTIVE FRONT)
    (SYNONYM DOOR LOCK)
    ;(ACTION FRONT-DOOR-F)
    ;(GENERIC LOCKED-F)
    (FLAGS DOORBIT LOCKEDBIT)
>

<OBJECT FENCE (DESC "fence") (IN LOCAL-GLOBALS)
    (SYNONYM FENCE)
    ;(ACTION FENCE-F)
>

<ROOM FRONT-YARD (DESC "Front Yard") (IN ROOMS)
    (LDESC
"You are in the front yard of the Linder property. Most of the space is
occupied by a kitchen garden full of vegetables and herbs. A wooden
fence surrounds the yard on the west and north sides. To the east is the
house, with a French door and two windows. To the south is a gate that
leads to the front porch.")
    (NORTH "A wooden fence blocks your way.")
    (SOUTH TO FRONT-PORCH ;IF ;FRONT-GATE ;IS ;OPEN)
    (EAST  TO DINING-ROOM ;IF ;DINING-DOOR ;IS ;OPEN)
    (WEST  "A wooden fence blocks your way.")
    (GLOBAL HOUSE DINING-DOOR KITCHEN-WINDOW BUTLER-WINDOW
        FRONT-GATE FRONT-DOOR FENCE)
    (FLAGS LIGHTBIT)
>

<ROOM FRONT-PORCH (DESC "Front Porch") (IN ROOMS)
    (NORTH TO FRONT-YARD ;IF ;FRONT-GATE ;IS ;OPEN)
    (SOUTH TO DRIVEWAY)
    (EAST  TO ENTRY ;IF ;FRONT-DOOR ;IS ;OPEN)
    (IN TO ENTRY ;IF ;FRONT-DOOR ;IS ;OPEN)
    (WEST "A wooden fence blocks your way.")
    ;(ACTION FRONT-PORCH-F)
    (FLAGS LIGHTBIT)
>

<ROOM DRIVEWAY (DESC "Driveway") (IN ROOMS)
    (LDESC
"The driveway, paved with peastone, runs from the entrance at the south
end in a curve to a two-car garage at the east end. North of you is the
front porch, the entrance to the house.")
    (NORTH TO FRONT-PORCH)
    (SOUTH TO DRIVEWAY-ENTRANCE)
    (EAST  TO GARAGE)
    (WEST  "A wooden fence blocks your way.")
    (FLAGS LIGHTBIT)
>

<ROOM DRIVEWAY-ENTRANCE (DESC "Driveway Entrance") (IN ROOMS)
    (LDESC
"You are standing at the foot of the driveway, the entrance to the
Linder property. The entire lot is screened from the street and the
neighbors by a wooden fence, except on the east
side, which fronts on dense bamboo woods. The house looks like a mixture of
a California bungalow and East Asian influences. From here you can
see the driveway leading north and, beyond that, the front door.")
    (NORTH TO DRIVEWAY)
    (SOUTH "You can't leave the property yet. It would mean your job.")
    (EAST  TO SIDE-YARD)
    (WEST  "A wooden fence blocks your way.")
    (FLAGS LIGHTBIT)
>

<ROOM LIMBO (DESC "limbo") (IN ROOMS)
    ;(NORTH TO DRIVEWAY-ENTRANCE)
    ;(CONTFCN NULL-F)
    (FLAGS LIGHTBIT)
>

<ROOM SIDE-YARD (DESC "Side Yard") (IN ROOMS)
    (NORTH  "You can't enter the house from here.")
    (SOUTH  "A wooden fence blocks your way.")
    (EAST   TO OFFICE-PATH)
    (WEST   TO DRIVEWAY-ENTRANCE)
    ;(ACTION SIDE-YARD-F)
    (FLAGS  LIGHTBIT)
>

<ROOM OFFICE-PATH (DESC "office path") (IN ROOMS)
    (LDESC
"You are on a path made of stepping stones, which leads from the back
gate at the south to Linder's office at the north. In the east you
can see a thick woods. To the west is the side yard.")
    (NORTH TO OFFICE-PORCH)
    (SOUTH "You can't leave the property yet. It would mean your job.")
    (EAST  "You would probably get lost in the woods.")
    (WEST  TO SIDE-YARD)
    (FLAGS LIGHTBIT)
>

<ROOM OFFICE-PORCH (DESC "office porch") (IN ROOMS)
	(NORTH TO BACK-YARD)
	(SOUTH TO OFFICE-PATH)
	(EAST "You would probably get lost in the woods.")
	(WEST TO OFFICE ;IF ;OFFICE-BACK-DOOR ;IS ;OPEN)
    (IN TO OFFICE ;IF ;OFFICE-BACK-DOOR ;IS ;OPEN)
    ;(ACTION OFFICE-PORCH-F)
    (FLAGS LIGHTBIT)
>

<ROOM BACK-YARD (DESC "back yard") (IN ROOMS)
    (LDESC
"You are on a neatly manicured lawn, east of Monica's bedroom. The lawn
extends east to the edge of the woods. From here you can go to a rock
garden in the north or the entrance to Linder's office in the south.
There's a door into the house, and a window.")
	(NORTH TO ROCK-GARDEN)
	(SOUTH TO OFFICE-PORCH)
	(EAST  "You would probably get lost in the woods.")
	(WEST  TO MONICA-ROOM ;IF ;MONICA-BACK-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM ROCK-GARDEN (DESC "rock garden") (IN ROOMS)
    (LDESC
"This is a rock garden in the Japanese style, east of Linder's bedroom.
A few smooth round boulders lie partly buried in a bed of gravel,
which is carefully raked to be reminiscent of flowing water.
A sequence of smaller rocks forms a zig-zag path from the bedroom door to
the south edge of the garden, where the lawn begins.
There's a door into the house, and a couple of windows.")
    (NORTH "A wooden fence blocks your way.")
    (SOUTH TO BACK-YARD)
    (EAST  "You would probably get lost in the woods.")
    (WEST  TO LINDER-ROOM ;IF ;LINDER-BACK-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM MONICA-ROOM (DESC "Monica's bedroom") (IN ROOMS)
    (NORTH TO BATHROOM ;IF ;MONICA-BATH-DOOR ;IS ;OPEN)
    (EAST TO BACK-YARD ;IF ;MONICA-BACK-DOOR ;IS ;OPEN)
    (OUT  TO BACK-YARD ;IF ;MONICA-BACK-DOOR ;IS ;OPEN)
    (WEST TO HALL-2 ;IF ;MONICA-DOOR ;IS ;OPEN)
    ;(ACTION MONICA-ROOM-F)
    ;(GENERIC GENERIC-BEDROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM BATHROOM (DESC "bathroom") (IN ROOMS)
    (LDESC
"This room has only a large cabinet with counter, sink and mirror.
On the counter are a shaver, toothpaste, and so on.
The tub and toilet must be in separate rooms.
There are doors on all four walls: the one to the north looks like redwood,
the one to the south like cedar, and the other two like ordinary doors.")
    (NORTH TO LINDER-ROOM ;IF ;LINDER-BATH-DOOR ;IS ;OPEN)
    (SOUTH TO MONICA-ROOM ;IF ;MONICA-BATH-DOOR ;IS ;OPEN)
    (EAST TO TUB-ROOM ;IF ;TUB-DOOR ;IS ;OPEN)
    (WEST TO TOILET-ROOM ;IF ;TOILET-DOOR ;IS ;OPEN)
    ;(GENERIC GENERIC-BATHROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM TUB-ROOM (DESC "tub room") (IN ROOMS)
    (LDESC
"This is a separate room, completely lined with tile, for bathing in the
Japanese style. On one side is a shower head and drain, where you could
wash away surface dirt. On the other side is a deep tub, to be filled
with steaming water up to your neck. Potted plants give the room a
tropical air. A window looks over the rock garden outside, and a door
leads west.")
    (WEST TO BATHROOM ;IF ;TUB-DOOR ;IS ;OPEN)
    (OUT  TO BATHROOM ;IF ;TUB-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM TOILET-ROOM (DESC "toilet room") (IN ROOMS)
    (LDESC "This is a separate room for a toilet only.")
    (EAST TO BATHROOM ;IF ;TOILET-DOOR ;IS ;OPEN)
    (OUT  TO BATHROOM ;IF ;TOILET-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM LINDER-ROOM (DESC "Linder's bedroom") (IN ROOMS)
    (SOUTH TO BATHROOM ;IF ;LINDER-BATH-DOOR ;IS ;OPEN)
    (EAST TO ROCK-GARDEN ;IF ;LINDER-BACK-DOOR ;IS ;OPEN)
    (OUT  TO ROCK-GARDEN ;IF ;LINDER-BACK-DOOR ;IS ;OPEN)
    (WEST TO LIVING-ROOM ;IF ;LINDER-DOOR ;IS ;OPEN)
    ;(GENERIC GENERIC-BEDROOM-F)
    ;(ACTION LINDER-ROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM LIVING-ROOM (DESC "living room") (IN ROOMS)
    (SOUTH TO HALL-1)
    (EAST TO LINDER-ROOM ;IF ;LINDER-DOOR ;IS ;OPEN)
    (WEST TO DINING-ROOM ;IF ;LIVING-DINING-DOOR ;IS ;OPEN)
    ;(ACTION LIVING-ROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM DINING-ROOM (DESC "dining room") (IN ROOMS)
    (LDESC
"A table and benches, built out of blond wood for six people, sit in the
middle of the room. On the south wall is a swinging door that leads to
the kitchen, and on the east wall a double door to the living room.
Through a French door on the west wall you can see the front yard.")
    (SOUTH TO KITCHEN ;IF ;KITCHEN-DINING-DOOR ;IS ;OPEN)
    (EAST TO LIVING-ROOM ;IF ;LIVING-DINING-DOOR ;IS ;OPEN)
    (WEST TO FRONT-YARD ;IF ;DINING-DOOR ;IS ;OPEN)
    (OUT  TO FRONT-YARD ;IF ;DINING-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM KITCHEN (DESC "kitchen") (IN ROOMS)
    (LDESC
"The Linder kitchen is full of electric appliances: range and hood,
refrigerator, mixer, toaster, clock, and so on. Several white steel
cabinets make for plenty of storage space. To the north is the dining
room, to the east the hall.")
    (NORTH TO DINING-ROOM ;IF ;KITCHEN-DINING-DOOR ;IS ;OPEN)
    (EAST TO HALL-1 ;IF ;KITCHEN-HALL-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM HALL-1 (DESC "hallway") (IN ROOMS)
    (NORTH TO LIVING-ROOM)
    (SOUTH TO HALL-2)
    (WEST TO KITCHEN ;IF ;KITCHEN-HALL-DOOR ;IS ;OPEN)
    ;(ACTION  HALL-1-F)
    (FLAGS LIGHTBIT)
>

<ROOM HALL-2 (DESC "hallway") (IN ROOMS)
    (NORTH TO HALL-1)
    (SOUTH TO HALL-3)
    (EAST TO MONICA-ROOM ;IF ;MONICA-DOOR ;IS ;OPEN)
    (WEST TO BUTLER-ROOM ;IF ;BUTLER-DOOR ;IS ;OPEN)
    ;(ACTION HALL-2-F)
    (FLAGS LIGHTBIT)
>

<ROOM BUTLER-ROOM (DESC "butler's room") (IN ROOMS)
    (NORTH TO BUTLER-BATH ;IF ;BUTLER-BATH-DOOR ;IS ;OPEN)
    (IN    TO BUTLER-BATH ;IF ;BUTLER-BATH-DOOR ;IS ;OPEN)
    (EAST TO HALL-2 ;IF ;BUTLER-DOOR ;IS ;OPEN)
    (OUT TO HALL-2 ;IF ;BUTLER-DOOR ;IS ;OPEN)
    ;(ACTION BUTLER-ROOM-F)
    ;(GENERIC GENERIC-BEDROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM BUTLER-BATH (DESC "butler's bathroom") (IN ROOMS)
    (SOUTH TO BUTLER-ROOM ;IF ;BUTLER-BATH-DOOR ;IS ;OPEN)
    (OUT   TO BUTLER-ROOM ;IF ;BUTLER-BATH-DOOR ;IS ;OPEN)
    ;(ACTION BUTLER-BATH-F)
    ;(GENERIC GENERIC-BATHROOM-F)
    (FLAGS LIGHTBIT)
>

<ROOM HALL-3
	(DESC "hallway")
	(IN ROOMS)
	(LDESC
"This hallway seems to run the length of the house, from the garage
at the south end to the living room at the north. There is enough warm yellow
light flooding from the living room for you to see a few doors on each side
of the hall.")
	(NORTH TO HALL-2)
	(SOUTH TO HALL-4)
	(WEST  TO ENTRY)
	(OUT   TO ENTRY)
    (FLAGS LIGHTBIT)
>

<ROOM ENTRY (DESC "entry") (IN ROOMS)
    (EAST TO HALL-3)
    (WEST TO FRONT-PORCH ;IF ;FRONT-DOOR ;IS ;OPEN)
    (OUT TO FRONT-PORCH ;IF ;FRONT-DOOR ;IS ;OPEN)
	;(ACTION ENTRY-F)
    (FLAGS LIGHTBIT)
>

<ROOM STORAGE-CLOSET (DESC "storage closet") (IN ROOMS)
	(LDESC
"This is a little-used storage closet containing odds and ends of no interest
whatsoever. The exit is to the east.")
	(EAST TO HALL-4 ;IF ;STORAGE-DOOR ;IS ;OPEN)
	(OUT  TO HALL-4 ;IF ;STORAGE-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM HALL-4 (DESC "hallway") (IN ROOMS)
    (LDESC
"This is the south end of a hallway that runs the length of the house.
At the far end, to the north, you can see the living room; immediately
to the south is a door. Other doors on both sides lead to other rooms.")
    (NORTH TO HALL-3)
    (SOUTH TO GARAGE ;IF ;GARAGE-DOOR ;IS ;OPEN)
    (OUT   TO GARAGE ;IF ;GARAGE-DOOR ;IS ;OPEN)
    (EAST TO OFFICE ;IF ;OFFICE-DOOR ;IS ;OPEN)
    (WEST TO STORAGE-CLOSET ;IF ;STORAGE-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>

<ROOM OFFICE (DESC "office") (IN ROOMS)
	(EAST TO OFFICE-PORCH ;IF ;OFFICE-BACK-DOOR ;IS ;OPEN)
	(OUT  TO OFFICE-PORCH ;IF ;OFFICE-BACK-DOOR ;IS ;OPEN)
	(WEST TO HALL-4 ;IF ;OFFICE-DOOR ;IS ;OPEN)
	;(ACTION OFFICE-F)
    (FLAGS LIGHTBIT)
>

<ROOM GARAGE (DESC "Garage") (IN ROOMS)
    (NORTH TO HALL-4 ;IF ;GARAGE-DOOR ;IS ;OPEN)
    (EAST TO WORKSHOP ;IF ;WORKSHOP-DOOR ;IS ;OPEN)
    (WEST TO DRIVEWAY)
    ;(ACTION GARAGE-F)
    (FLAGS LIGHTBIT)
>

<ROOM WORKSHOP (DESC "workshop") (IN ROOMS)
	(LDESC
"This room is a well-equipped workshop. Besides the usual sort of tools,
the place is full of mechanical and electrical parts and supplies:
switches, relays, spools of colored wire, and so on. One wall holds the
main electric board and a home-made junction box with more wires going
in and out than you can shake a stick at. The only door is the one you
came in.")
	(WEST TO GARAGE ;IF ;WORKSHOP-DOOR ;IS ;OPEN)
    (FLAGS LIGHTBIT)
>


"Plot"
