# data

These are the files where our project data are stored:

- "GTBK_2010_2018"
- "GTBK 2018_2023"
- "buis_2022"

# variables

These are lists of the variables in each dataset, along with their descriptions:

## GTBK_2010_2018
This dataset is the work from Grupo Tortugero Bahía de Kino from 2010 to 2018. It includes recapture data, turtle identification, and effort-based data. 

Variables: 23
Observations: 409

- `ID#`: identification number for each turtle
- `Nombre de la tortuga`: the turtle's given name 
- `No. Monitoreo	Estacion`: monitoring station	
- `Fecha`: date
- `Area de Monitoreo`: monitoring location
- `Posicion (Lati. Long.)`: location (lat/long)	
- `Hora de captura`: hour of capture 
- `Especie`: species	
- `Peso (Kg)': weight (kg)	
- `Sexo`: sex	
- `L.R.C. (cm)`: carapace length 	
- `L.C.C.(cm)`: curved carapace length
- `A.R.C.(cm)`: carapace width	
- `A.C.C.(cm)`: curved carapace width 	
- `P.C (cm)`: plastron depth	
- `L.P (cm)`: plastron length	
- `LTC (cm)`: tail length 	
- `¿Posee marca? (Recaptura)`: recapture? (yes/no)
- `Marca Derecha`: right tag number
- `Marca Izquierda`: left tag number
- `Observaciones y comentarios`: observations and comments 


## GTBK_2018_2023
This dataset is the work from Grupo Tortugero Bahía de Kino from 2018 to 2023. It includes recapture data, turtle identification, and effort-based data. 

Variables: 54
Observations: 471

- `Codigo_Comunidad`: community code	
- `Responsable`: people in charge of the data	
- `Red numero`: network number 	
- `Fecha_inicio`: start date	
- `Hora_inicio`: start hour	
- `Hora_fin`: end hour	
- `Total_horas`: total effort hours 
- `Tipo_monitoreo`: monitoring type 
- `Metodologia`: methodology
- `Longitud red / lanceos`: 
- `Lugar_captura`: capture location, name	
- `Latitud`: capture location latitude 	
- `Longitud`: capture location longitude	
- `Unidad (UTM o grados)`:	
- `Fecha_captura`: date of capture
- `Hora_captura`: time of capture
- `Nombre tortuga`: the turtle's given name	
- `Especie`: species	
- `LRC`: carapace length	
- `ARC`: carapace width	
- `LCC`: curved carapace length
- `ACC`: curved carapace width
- `Profundidad cuerpo`: carapace depth	
- `Longitud plastron`: plastron length
- `Longitud total cola`: total tail length 
- `Peso_kg`: weight (kg)	
- `Sexo`: sex
- `Material_marcas`: markings	
- `Marca nueva DX`: new tag (right)	number
- `Marca nueva SX`: new tag (left) number
- `Marca previa DX`: old tag (right) number
- `Marca previa SX`: old tag (left) number
- `PIT tag (si, no)`: PIT Tag (yes/no)	
- `PIT nuevo`: new PIT Tag number 
- `PIT previo`: old PIT Tag number
- `Muestra sangre (si o no)`: bleeding (yes/no)
- `Muestra piel  (si o no)`: damaged skin (yes/no)
- `Muestra cont estom  (si o no)`: stomach contents (yes/no)	
- `Otra muestra  (si o no)`: other (yes/no)
- `Especificar`: details for "otra muestra"
- `Lesiones / Balanos`: lesions or barnacles	
- `Foto (si o no)`: photo? (yes/no)	
- `Comentarios`: comments	
- `ID #`: ID Number	

## buis_2022
This dataset contains morphological information about the Hawksbill and Green sea turtles that were recorded nesting on Buck Island, Saint Croix, USVI during the 2022 nesting season. Each observation represents an individual turtle.

Variables: 12
Observations: 56

- `activityno`: a unique numerical identifier representing each individual nesting activity from 2022
- `CDate`: date that the sea turtle was measured in 2022
- `PrimaryTag`: “name” of the turtle (the first tag that the turtle was ever given)
- `sp`: species
- `ApplyDate`: date that the turtle was given her primary tag
- `Remi?`: (TRUE/FALSE) indicates whether the turtle had been captured/tagged before 2022
- `cclnucn`: curved carapace length from nuchal notch to notch (cm)
- `ccw`: curved carapace width (cm)
- `cclnuct`: curved carapace length from nuchal notch to carapace tip (cm)
- `cclnott`: curved carapace length from notch to carapace tip (cm)
- `location` : capture location (Buck Island)
- `sex`: sex of the turtle (female)



