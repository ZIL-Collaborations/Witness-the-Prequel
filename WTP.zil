"W I T N E S S :   T H E   P R E Q U E L   -  Main File"

"THE PROJECT"

<CONSTANT GAME-TITLE "Witness: The Prequel">
<CONSTANT GAME-DESCRIPTION
"A mystery story by Friends of ZILF|
(based upon characters and scenarios created by Stu Galley for Infocom, Inc.)">

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
<INSERT-FILE "../Extensions/Finishing">

"Game Specific Interaction and Behaviour"

<INSERT-FILE "Actions">
<INSERT-FILE "Activities">

"Extra Game Verbs - None"

"Library Hooks"

<BIND ((REDEFINE T))
    <DEFMAC HOOK-END-OF-COMMAND ()
       '<BIND ()
            <FINISH-IF-CODE-SET>      ;"Finishing"
        >
    >
>


"THE GAME"

"Setting the Scene"

<ROUTINE SET-THE-SCENE ()
    <SETG SCORE 20>
    <SETG HERE WORKSHOP>
    <MOVE PLAYER ,HERE>
>

"Introduction"

<ROUTINE INTRODUCE-THE-GAME ()
    <TELL CR CR "
BANG!||
\"Monica.\"||
\"Monica, it worked. You can open your eyes now.\"||
But not just yet. You won't be here to smell the gunpowder, or to watch the old man slump over his desk.
You won't be here when he realizes he can't manipulate his way out of this pickle. When he realizes he signed his own death warrant.||
But you can imagine it. Just a moment longer.||
Finally, you allow your eyes to float open. \"Yes, Phong. It worked. Everything is on schedule.\"
" CR>
    <CRLF> <V-VERSION>
    <CRLF> <V-LOOK>
>

"Cast, Setting and Plot"

<INSERT-FILE "Characters">
<INSERT-FILE "Locations">
<INSERT-FILE "Scenes">
