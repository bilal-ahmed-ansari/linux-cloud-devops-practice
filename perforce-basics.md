These 3 terms are important in order to understand Perforce

Depot, Stream, Workspace


1. What is Perforce?

Perforce is a system used by Unreal, Realtime teams to centrally store and manage project files.

For example, an artist may have files like:

shot010
├── maya_file.mb
├── textures
└── render_setup

These files are not managed only on the artist's computer. They are also stored and managed on the Perforce server.

Main purpose of Perforce:
Store project files in a central location
Allow multiple artists to work on the same project
Maintain different versions of files
Track who changed a file
Restore an older version when required
Checkout the file (take a file from Perforce before editing), edit a file, and submit files (save changes to Perforce)


2. What is a Depot?

Depot = The main storage area on the Perforce server where project files are stored and managed.

Simple example:

Perforce Server
│
└── Depot
    │
    └── SIDEWINDER
        ├── SWD_Quantum-dev
       

For example, a Perforce file path can look like:

//SIDEWINDER/SWD_Quantum-dev

Here:

//SIDEWINDER/

can be the Depot name.


3. What is a Stream?

What will be the project changes or whhich stages you will be performing in order to create a project

Depot 
│
 └── VFX_Project 
     ├── Main → Main/stable project 
     ├── Dev → Working area for artists/developers (in my eg, I have created Dev stream called SWD_Qunatum-dev
     └── Release → Approved/released version


4. What is a Workspace?

This is also a very important concept.

Workspace = The working area on an artist's local machine where Perforce files are stored and edited.

For example, an artist's computer may have:

/home/artist/project/

The Perforce workspace connects this local folder to files stored on the Perforce server.

The artist can sync files from Perforce to their local machine.

And then The artist then makes changes to the files:

Artist PC 
   ↓ 
Edit file 
   ↓ 
Submit 
   ↓ 
Perforce Server
