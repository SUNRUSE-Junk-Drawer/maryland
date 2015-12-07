The "maps" object in the root of the game object is a key-object map representing places which can only be travelled between using doors.
Each contains:

- name (localization key-string map)
- cells (key-object map; see below)
- navmeshVertices (key-array of 3 integer representing coordinate map)

# Cells

Cells represent rooms or zones of a place.
It is possible to see between cells in the same map.
Each contains:

- name (localization key-string map)
- internalDoors (key-object map; see below)
- teleporterDoors (key-object map; see below)
- faction (string identifying the faction which owns the cell)
- navmeshTriangles (key-object map; see below)

# Navmesh Triangles

Each object represents a triangle of the navmesh in the cell.
This is used by players and NPCs, and is a map of where they can go.
Each contains:

- vertices (array of three strings identifying items in the maps's navmeshVertices)

# Internal Doors

Each object represents a door along a navmesh triangle edge, linking two cells.
Each contains:

- vertices (array of two strings identifying items in the map's navmeshVertices)

# Teleporter Doors

Each object represents a door which can be used to move to a different map or place in the current map instantly.
Each contains:

- vertices (array of two strings identifying items in the map's navmeshVertices)
- map (string identifying the map the door teleports to)
- cell (string identifying the cell the door teleports to)
- navmeshTriangle (string identifying the navmesh triangle the door teleports to)
- coordinate (array of two floats representing a barycentric coordinate inside the destination navmesh triangle)
