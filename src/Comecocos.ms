try (DestroyDialog come) catch()

global desde_valor = 1
global hasta_valor = 200
global desde_valor2 = 1
global hasta_valor2 = 20
global color_fantasma_global = "Rojo"
global Xmapa = 0.0
global Ymapa= 0.0
global Zmapa = 0.0
global tam_mapa = 100
global matSuelo = undefined
global matPared = undefined
global color_suelo = color 153 153 129
global color_pared = color 153 153 129
global filas_matriz = 5
global m = #()
global tam_pared = 8
rollout come "COMECOCOS" width:450 height:700
(
	subRollout rollDentro "Dentro" pos:[5,10] width:440 height:690
)

rollout inmune "Comecocos Inmune" width:296 height:104
(

	spinner 'desde' "Desde" pos:[20,12] width:232 height:16 range:[1,1000,0] type:#integer scale:1 align:#left
	
	spinner 'hasta' "Hasta" pos:[20,42] width:232 height:16 range:[1,1000,200] type:#integer scale:1 heeight:16 align:#left
	
	button 'b1' "Cambia fantasmas a color azul" pos:[135,68] width:157 height:21 align:#left
	
	on desde changed nuevo do
	(
		
		desde_valor = nuevo
		
	)
	on hasta changed nuevo do
	(
		
		hasta_valor = nuevo
		
	)
	on b1 pressed do
	(
		if(desde_valor < hasta_valor) then (
			
			local color_tmp = $fant_rosa.material.base_color
			
			animate on (
				
				at time (desde_valor-1) (
					$fant_rosa.material.base_color = color_tmp
					
				)
				at time desde_valor (
					
					$fant_rosa.material.base_color = blue
	
					
				)
				at time (hasta_valor-5) (
					
					$fant_rosa.material.base_color= blue
			
				)
				at time hasta_valor (
					
					$fant_rosa.material.base_color= color_tmp
		
				)
			)
			
			local color_tmp2 = $fant_azul.material.base_color
			
			animate on (
				
				at time (desde_valor-1) (
					
					$fant_azul.material.base_color = color_tmp2
					
				)
				at time desde_valor (
					
					$fant_azul.material.base_color = blue
	
					
				)
				at time (hasta_valor-5) (
					
					$fant_azul.material.base_color= blue
			
				)
				at time hasta_valor (
					
					$fant_azul.material.base_color= color_tmp2
		
				)
			)
			
			local color_tmp3 = $fant_naranja.material.base_color
			
			animate on (
				
				at time (desde_valor-1) (
					
					$fant_naranja.material.base_color = color_tmp3
					
				)
				at time desde_valor (
					
					$fant_naranja.material.base_color = blue
	
				)
				at time (hasta_valor-5) (
					
					$fant_naranja.material.base_color= blue
			
				)
				at time hasta_valor (
					
					$fant_naranja.material.base_color= color_tmp3
		
				)
			)
			
			
			local color_tmp4 = $fant_rojo.material.base_color
			
			animate on (
				
				at time (desde_valor-1) (
					
					$fant_rojo.material.base_color = color_tmp4
					
				)
				at time desde_valor (
					
					$fant_rojo.material.base_color = blue
		
				)
				at time (hasta_valor-5) (
					
					$fant_rojo.material.base_color= blue
			
				)
				at time hasta_valor (
					
					$fant_rojo.material.base_color= color_tmp4
		
				)
			)
		)
		else (
			
			messageBox("El valor Desde debe ser menor que el Hasta")
		)
	)
)

rollout mata_fantasma "Matar Fantasma" width:310 height:600 (
	
	dropdownList EligeFantasma "Fantasma"  enabled:true items:#("Rojo", "Azul", "Naranja","Rosa")	
	
	spinner 'desde2' "Desde" range:[1,1000,0] type:#integer align:#left
	
	spinner 'hasta2' "Hasta " range:[1,1000,20] type:#integer align:#left
	
	
	checkbox 'c_twist' "Aplicar deformador Twist" enabled:true checked:false align:#left
	checkbox 'c_bend' "Aplicar deformador Bend" enabled:true checked:false align:#left
	
	
	button 'b2' "Mata al fantasma" 

	
	on desde2 changed nuevo do
	(
		desde_valor2 = nuevo
	)
	
	on hasta2 changed nuevo do
	(
		hasta_valor2 = nuevo
	)
		
	on EligeFantasma selected nuevo2 do (
		
		color_fantasma_global = EligeFantasma.selected
		
	) 
	
	on b2 pressed do(
		
		if(desde_valor2 < hasta_valor2) then (
			
			if (color_fantasma_global == "Rojo") then(
				
				animate on (
		
					local pos1 = $mata_rojo.pos
					
					at time desde_valor2 (
						
						$mata_rojo.scale = [1.5422,1.5422,1.6119]
						$mata_rojo.pos = [pos1[1],pos1[2],pos1[3]]
						
						
						if(c_twist.checked) then (
							addmodifier $mata_rojo (Twist name:"mod_twist")
							$mata_rojo.modifiers[#mod_twist].angle = 0
						)
						if(c_bend.checked) then (
							addmodifier $mata_rojo (Bend name:"mod_bend")
							$mata_rojo.modifiers[#mod_bend].angle = 0
							$mata_rojo.modifiers[#mod_bend].direction = 90
						)
						
					)
					at time hasta_valor2 (
						
						$mata_rojo.scale = [0.001,0.001,0.001]
						$mata_rojo.pos = [pos1[1],pos1[2],(pos1[3]-30)]
						if(c_twist.checked) then (
							$mata_rojo.modifiers[#mod_twist].angle = 400
						)
						if(c_bend.checked) then (
							$mata_rojo.modifiers[#mod_bend].angle = 90
							$mata_rojo.modifiers[#mod_bend].direction = 90
						)	
					)
				)
			)
			else if (color_fantasma_global == "Naranja") then(
				
				animate on (
		
					local pos1 = $mata_naranja.pos
					
					at time desde_valor2 (
						
						$mata_naranja.scale = [1.5422,1.5422,1.6119]
						$mata_naranja.pos = [pos1[1],pos1[2],pos1[3]]
						if(c_twist.checked) then (
							addmodifier $mata_naranja (Twist name:"mod_twist")
							$mata_naranja.modifiers[#mod_twist].angle = 0
						)
						if(c_bend.checked) then (
							addmodifier $mata_naranja (Bend name:"mod_bend")
							$mata_naranja.modifiers[#mod_bend].angle = 0
							$mata_naranja.modifiers[#mod_bend].direction = 90
						)

						
					)
					at time hasta_valor2 (
						
						$mata_naranja.scale = [0.001,0.001,0.001]
						$mata_naranja.pos = [pos1[1],pos1[2],(pos1[3]-30)]
						
						if(c_twist.checked) then (
							$mata_naranja.modifiers[#mod_twist].angle = 400
						)
						if(c_bend.checked) then (
							$mata_naranja.modifiers[#mod_bend].angle = 90
							$mata_naranja.modifiers[#mod_bend].direction = 90
						)	
					)
				)
			)
			else if (color_fantasma_global == "Azul") then(
				
				animate on (
		
					local pos1 = $mata_azul.pos
					
					at time desde_valor2 (
						
						$mata_azul.scale = [1.5422,1.5422,1.6119]
						$mata_azul.pos = [pos1[1],pos1[2],pos1[3]]
						
						if(c_twist.checked) then (
							addmodifier $mata_azul (Twist name:"mod_twist")
							$mata_azul.modifiers[#mod_twist].angle = 0
						)
						if(c_bend.checked) then (
							addmodifier $mata_azul (Bend name:"mod_bend")
							$mata_azul.modifiers[#mod_bend].angle = 0
							$mata_azul.modifiers[#mod_bend].direction = 90
						)

					)
					at time hasta_valor2 (
						
						$mata_azul.scale = [0.001,0.001,0.001]
						$mata_azul.pos = [pos1[1],pos1[2],(pos1[3]-30)]
						
						if(c_twist.checked) then (
							$mata_azul.modifiers[#mod_twist].angle = 400
						)	
						if(c_bend.checked) then (
							$mata_azul.modifiers[#mod_bend].angle = 90
							$mata_azul.modifiers[#mod_bend].direction = 90
						)	
					)
				)
			)
			else if (color_fantasma_global == "Rosa") then(
				
				animate on (
		
					local pos1 = $mata_rosa.pos
					
					at time desde_valor2 (
						
						$mata_rosa.scale = [1.5422,1.5422,1.6119]
						$mata_rosa.pos = [pos1[1],pos1[2],pos1[3]]
						
						if(c_twist.checked) then (
							addmodifier $mata_rosa (Twist name:"mod_twist")
							$mata_rosa.modifiers[#mod_twist].angle = 0
						)
						if(c_bend.checked) then (
							addmodifier $mata_rosa (Bend name:"mod_bend")
							$mata_rosa.modifiers[#mod_bend].angle = 0
							$mata_rosa.modifiers[#mod_bend].direction = 90
						)
						
					)
					at time hasta_valor2 (
						
						$mata_rosa.scale = [0.001,0.001,0.001]
						$mata_rosa.pos = [pos1[1],pos1[2],(pos1[3]-30)]
						if(c_twist.checked) then (
							$mata_rosa.modifiers[#mod_twist].angle = 400
						)	
						if(c_bend.checked) then (
							$mata_rosa.modifiers[#mod_bend].angle = 90
							$mata_rosa.modifiers[#mod_bend].direction = 90
						)	
					)
				)
			)
		)
		else (
			
			messageBox("El valor Desde debe ser menor que el Hasta")
			
		)
	)	
	

)
-- 573 - 577
rollout mapa "Generador de mapas" width:310 height:949
(
	
	GroupBox 'POSICION2' "Posición" pos:[58,9] width:300 height:89 align:#left
	-- label 'Posicion' "Posición del Mapa" pos:[39,21] width:82 height:13 align:#left 

	spinner 'coorXmapa' "X: " pos:[108,32] width:144 height:16 range:[-1000,1000,0] type:#float align:#left

	spinner 'coorYmapa' "Y: " pos:[108,52] width:144 height:16 range:[-1000,1000,0] type:#float align:#left
 
	spinner 'coorZmapa' "Z: " pos:[108,72] width:144 height:16 range:[-1000,1000,0] type:#float align:#left
 
	GroupBox 'POSICION3' "Tamaño" pos:[58,112] width:300 height:56 align:#left
	--label 'Tamaño' "Tamaño del Mapa" pos:[39,116] width:83 height:13 type:#integer align:#left
	
	spinner 'tam' "X: " pos:[108,136] width:144 height:16 range:[-1000,1000,100] align:#left
	
	--label 'material' "Suelo" pos:[39,179] width:26 height:13 align:#left 
	GroupBox 'suelo' "Suelo" pos:[62,185] width:300 height:89 align:#left
 

	radiobuttons 'radio_material' "" pos:[72,208] width:303 height:16 labels:#("Por defecto", "Material", "Wirecolor") columns:3 align:#left
	materialButton 'selectMat' "Seleccionar Material" pos:[77,240] width:109 height:21 enabled:false align:#left
	colorPicker 'pick_color_suelo' "Color: " pos:[219,240] width:76 height:20 enabled:false color:[153,153,129] title:"Color del suelo" align:#left

	--label 'paredes' "Paredes" pos:[32,300] width:37 height:13 align:#left 
	GroupBox 'pared' "Pared" pos:[58,298] width:300 height:119 align:#left
 
 
	radiobuttons 'radio_material_pared' "" pos:[72,327] width:303 height:16 labels:#("Por defecto", "Material", "Wirecolor") columns:3 align:#left
	materialButton 'selectMat_pared' "Seleccionar Material" pos:[77,355] width:109 height:21 enabled:false align:#left
	colorPicker 'pick_color_pared' "Color: " pos:[219,356] width:76 height:20 enabled:false color:[153,153,129] title:"Color de la pared" align:#left
	spinner 'altura_pared' "Altura: " pos:[155,393] width:116 height:16 range:[-1000,1000,8] align:#left  
	
	GroupBox 'pers' "" pos:[0,426] width:420 height:498 align:#left
	radiobuttons 'personalizado' ""  pos:[125,435] width:88 height:15 checked:false  labels:#("Aleatorio", "Personalizado") columns:2 align:#left

	
	label 'info matriz' "Activa las casillas de la matriz donde quieras que haya bloques" pos:[74,459] width:288 height:13 align:#left
	checkbox 'm1y1' "" pos:[5,491] width:24 height:15 enabled:false checked:true hide:true align:#left
	checkbox 'm1y2' "" pos:[35,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y3' "" pos:[65,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y4' "" pos:[95,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y5' "" pos:[125,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y6' "" pos:[155,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y7' "" pos:[185,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y8' "" pos:[215,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y9' "" pos:[245,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y10' "" pos:[275,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y11' "" pos:[305,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y12' "" pos:[335,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y13' "" pos:[365,491] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm1y14' "" pos:[395,491] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm2y1' "" pos:[5,521] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm2y2' "" pos:[35,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y3' "" pos:[65,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y4' "" pos:[95,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y5' "" pos:[125,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y6' "" pos:[155,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y7' "" pos:[185,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y8' "" pos:[215,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y9' "" pos:[245,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y10' "" pos:[275,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y11' "" pos:[305,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y12' "" pos:[335,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y13' "" pos:[365,521] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm2y14' "" pos:[395,521] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm3y1' "" pos:[5,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y2' "" pos:[35,551] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm3y3' "" pos:[65,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y4' "" pos:[95,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y5' "" pos:[125,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y6' "" pos:[155,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y7' "" pos:[185,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y8' "" pos:[215,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y9' "" pos:[245,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y10' "" pos:[275,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y11' "" pos:[305,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y12' "" pos:[335,551] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm3y13' "" pos:[365,551] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm3y14' "" pos:[395,551] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm4y1' "" pos:[5,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y2' "" pos:[35,581] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm4y3' "" pos:[65,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y4' "" pos:[95,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y5' "" pos:[125,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y6' "" pos:[155,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y7' "" pos:[185,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y8' "" pos:[215,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y9' "" pos:[245,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y10' "" pos:[275,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y11' "" pos:[305,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y12' "" pos:[335,581] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm4y13' "" pos:[365,581] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm4y14' "" pos:[395,581] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm5y1' "" pos:[5,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y2' "" pos:[35,611] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm5y3' "" pos:[65,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y4' "" pos:[95,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y5' "" pos:[125,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y6' "" pos:[155,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y7' "" pos:[185,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y8' "" pos:[215,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y9' "" pos:[245,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y10' "" pos:[275,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y11' "" pos:[305,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y12' "" pos:[335,611] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm5y13' "" pos:[365,611] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm5y14' "" pos:[395,611] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm6y1' "" pos:[5,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y2' "" pos:[35,641] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm6y3' "" pos:[65,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y4' "" pos:[95,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y5' "" pos:[125,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y6' "" pos:[155,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y7' "" pos:[185,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y8' "" pos:[215,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y9' "" pos:[245,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y10' "" pos:[275,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y11' "" pos:[305,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y12' "" pos:[335,641] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm6y13' "" pos:[365,641] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm6y14' "" pos:[395,641] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm7y1' "" pos:[5,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y2' "" pos:[35,671] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm7y3' "" pos:[65,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y4' "" pos:[95,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y5' "" pos:[125,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y6' "" pos:[155,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y7' "" pos:[185,671] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm7y8' "" pos:[215,671] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm7y9' "" pos:[245,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y10' "" pos:[275,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y11' "" pos:[305,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y12' "" pos:[335,671] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm7y13' "" pos:[365,671] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm7y14' "" pos:[395,671] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm8y1' "" pos:[5,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y2' "" pos:[35,701] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm8y3' "" pos:[65,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y4' "" pos:[95,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y5' "" pos:[125,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y6' "" pos:[155,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y7' "" pos:[185,701] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm8y8' "" pos:[215,701] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm8y9' "" pos:[245,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y10' "" pos:[275,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y11' "" pos:[305,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y12' "" pos:[335,701] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm8y13' "" pos:[365,701] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm8y14' "" pos:[395,701] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm9y1' "" pos:[5,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y2' "" pos:[35,731] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm9y3' "" pos:[65,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y4' "" pos:[95,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y5' "" pos:[125,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y6' "" pos:[155,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y7' "" pos:[185,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y8' "" pos:[215,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y9' "" pos:[245,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y10' "" pos:[275,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y11' "" pos:[305,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y12' "" pos:[335,731] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm9y13' "" pos:[365,731] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm9y14' "" pos:[395,731] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm10y1' "" pos:[5,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y2' "" pos:[35,761] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm10y3' "" pos:[65,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y4' "" pos:[95,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y5' "" pos:[125,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y6' "" pos:[155,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y7' "" pos:[185,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y8' "" pos:[215,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y9' "" pos:[245,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y10' "" pos:[275,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y11' "" pos:[305,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y12' "" pos:[335,761] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm10y13' "" pos:[365,761] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm10y14' "" pos:[395,761] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm11y1' "" pos:[5,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y2' "" pos:[35,791] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm11y3' "" pos:[65,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y4' "" pos:[95,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y5' "" pos:[125,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y6' "" pos:[155,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y7' "" pos:[185,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y8' "" pos:[215,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y9' "" pos:[245,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y10' "" pos:[275,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y11' "" pos:[305,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y12' "" pos:[335,791] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm11y13' "" pos:[365,791] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm11y14' "" pos:[395,791] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm12y1' "" pos:[5,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y2' "" pos:[35,821] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm12y3' "" pos:[65,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y4' "" pos:[95,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y5' "" pos:[125,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y6' "" pos:[155,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y7' "" pos:[185,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y8' "" pos:[215,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y9' "" pos:[245,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y10' "" pos:[275,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y11' "" pos:[305,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y12' "" pos:[335,821] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm12y13' "" pos:[365,821] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm12y14' "" pos:[395,821] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm13y1' "" pos:[5,851] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm13y2' "" pos:[35,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y3' "" pos:[65,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y4' "" pos:[95,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y5' "" pos:[125,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y6' "" pos:[155,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y7' "" pos:[185,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y8' "" pos:[215,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y9' "" pos:[245,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y10' "" pos:[275,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y11' "" pos:[305,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y12' "" pos:[335,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y13' "" pos:[365,851] width:24 height:15 enabled:false checked:false align:#left
	checkbox 'm13y14' "" pos:[395,851] width:24 height:15 enabled:false checked:true align:#left
	
	checkbox 'm14y1' "" pos:[5,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y2' "" pos:[35,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y3' "" pos:[65,880] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y4' "" pos:[95,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y5' "" pos:[125,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y6' "" pos:[155,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y7' "" pos:[185,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y8' "" pos:[215,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y9' "" pos:[245,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y10' "" pos:[275,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y11' "" pos:[305,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y12' "" pos:[335,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y13' "" pos:[365,881] width:24 height:15 enabled:false checked:true align:#left
	checkbox 'm14y14' "" pos:[395,881] width:24 height:15 enabled:false checked:true align:#left


	button 'activa_personalizado' "Activa todo" pos:[100,898] width:67 height:21 enabled:false align:#left
	button 'desactiva_personalizado' "Desactiva todo" pos:[253,898] width:83 height:21 enabled:false align:#left
	
	button 'crearMapa' "Crear Mapa" pos:[175,924] width:70 height:21 align:#left 
 
	on altura_pared changed param do
	(
			
			tam_pared = altura_pared.value
			
			
		)

	
	on coorXmapa changed param do
	(
			
			Xmapa = coorXmapa.value
			
		)
	on coorYmapa changed param do
	(
			
			Ymapa = coorYmapa.value
			
		)
	on coorZmapa changed param do
	(
			
			Zmapa = coorZmapa.value
			
		)
	on tam changed param do
	(
			
			tam_mapa = tam.value
			
	)
	on radio_material changed estado do
	(
			tipo=radio_material.state;
			if(tipo==1) then(
				selectMat.enabled = false	
				pick_color_suelo.enabled = false
				
			)
			else if (tipo == 2) then (
			
				selectMat.enabled = true
				pick_color_suelo.enabled = false
				
			)
			else if (tipo == 3) then (
			
				selectMat.enabled = false
				pick_color_suelo.enabled = true
				
			)
		)
	on selectMat picked param do
	(
		
		matSuelo = param
	)
	on pick_color_suelo changed param do
	(
		color_suelo = param
	)
	on radio_material_pared changed estado do
	(
			tipo=radio_material_pared.state;
			if(tipo==1) then(
				selectMat_pared.enabled = false	
				pick_color_pared.enabled = false
				
			)
			else if (tipo == 2) then (
			
				selectMat_pared.enabled = true
				pick_color_pared.enabled = false
				
			)
			else if (tipo == 3) then (
			
				selectMat_pared.enabled = false
				pick_color_pared.enabled = true
				
			)
		)
	on selectMat_pared picked param do
	(
		
		matPared = param
	)
	on pick_color_pared changed param do
	(
		color_pared = param
	)
	on personalizado changed est do
	(

		if personalizado.state==2 then(
		
			activa_personalizado.enabled = true
			desactiva_personalizado.enabled = true
			 (m1y1).enabled=true
			 (m1y2).enabled=true
			 (m1y3).enabled=true
			 (m1y4).enabled=true
			 (m1y5).enabled=true
			 (m1y6).enabled=true
			 (m1y7).enabled=true
			 (m1y8).enabled=true
			 (m1y9).enabled=true
			 (m1y10).enabled=true
			 (m1y11).enabled=true
			 (m1y12).enabled=true
			 (m1y13).enabled=true
			 (m1y14).enabled=true
			
			 (m2y1).enabled=true
			 (m2y2).enabled=true
			 (m2y3).enabled=true
			 (m2y4).enabled=true
			 (m2y5).enabled=true
			 (m2y6).enabled=true
			 (m2y7).enabled=true
			 (m2y8).enabled=true
			 (m2y9).enabled=true
			 (m2y10).enabled=true
			 (m2y11).enabled=true
			 (m2y12).enabled=true
			 (m2y13).enabled=true
			 (m2y14).enabled=true
			
			(m3y1).enabled=true
			 (m3y2).enabled=true
			 (m3y3).enabled=true
			 (m3y4).enabled=true
			 (m3y5).enabled=true
			 (m3y6).enabled=true
			 (m3y7).enabled=true
			 (m3y8).enabled=true
			 (m3y9).enabled=true
			 (m3y10).enabled=true
			 (m3y11).enabled=true
			 (m3y12).enabled=true
			 (m3y13).enabled=true
			 (m3y14).enabled=true
			
			 (m4y1).enabled=true
			 (m4y2).enabled=true
			 (m4y3).enabled=true
			 (m4y4).enabled=true
			 (m4y5).enabled=true
			 (m4y6).enabled=true
			 (m4y7).enabled=true
			 (m4y8).enabled=true
			 (m4y9).enabled=true
			 (m4y10).enabled=true
			 (m4y11).enabled=true
			 (m4y12).enabled=true
			 (m4y13).enabled=true
			 (m4y14).enabled=true
			
			 (m5y1).enabled=true
			 (m5y2).enabled=true
			 (m5y3).enabled=true
			 (m5y4).enabled=true
			 (m5y5).enabled=true
			 (m5y6).enabled=true
			 (m5y7).enabled=true
			 (m5y8).enabled=true
			 (m5y9).enabled=true
			 (m5y10).enabled=true
			 (m5y11).enabled=true
			 (m5y12).enabled=true
			 (m5y13).enabled=true
			 (m5y14).enabled=true
			
			 (m6y1).enabled=true
			 (m6y2).enabled=true
			 (m6y3).enabled=true
			 (m6y4).enabled=true
			 (m6y5).enabled=true
			 (m6y6).enabled=true
			 (m6y7).enabled=true
			 (m6y8).enabled=true
			 (m6y9).enabled=true
			 (m6y10).enabled=true
			 (m6y11).enabled=true
			 (m6y12).enabled=true
			 (m6y13).enabled=true
			 (m6y14).enabled=true
			
			 (m7y1).enabled=true
			 (m7y2).enabled=true
			 (m7y3).enabled=true
			 (m7y4).enabled=true
			 (m7y5).enabled=true
			 (m7y6).enabled=true
			 (m7y7).enabled=true
			 (m7y8).enabled=true
			 (m7y9).enabled=true
			 (m7y10).enabled=true
			 (m7y11).enabled=true
			 (m7y12).enabled=true
			 (m7y13).enabled=true
			 (m7y14).enabled=true
			
			 (m8y1).enabled=true
			 (m8y2).enabled=true
			 (m8y3).enabled=true
			 (m8y4).enabled=true
			 (m8y5).enabled=true
			 (m8y6).enabled=true
			 (m8y7).enabled=true
			 (m8y8).enabled=true
			 (m8y9).enabled=true
			 (m8y10).enabled=true
			 (m8y11).enabled=true
			 (m8y12).enabled=true
			 (m8y13).enabled=true
			 (m8y14).enabled=true
			
			 (m9y1).enabled=true
			 (m9y2).enabled=true
			 (m9y3).enabled=true
			 (m9y4).enabled=true
			 (m9y5).enabled=true
			 (m9y6).enabled=true
			 (m9y7).enabled=true
			 (m9y8).enabled=true
			 (m9y9).enabled=true
			 (m9y10).enabled=true
			 (m9y11).enabled=true
			 (m9y12).enabled=true
			 (m9y13).enabled=true
			 (m9y14).enabled=true
			
			 (m10y1).enabled=true
			 (m10y2).enabled=true
			 (m10y3).enabled=true
			 (m10y4).enabled=true
			 (m10y5).enabled=true
			 (m10y6).enabled=true
			 (m10y7).enabled=true
			 (m10y8).enabled=true
			 (m10y9).enabled=true
			 (m10y10).enabled=true
			 (m10y11).enabled=true
			 (m10y12).enabled=true
			 (m10y13).enabled=true
			 (m10y14).enabled=true
			
			 (m11y1).enabled=true
			 (m11y2).enabled=true
			 (m11y3).enabled=true
			 (m11y4).enabled=true
			 (m11y5).enabled=true
			 (m11y6).enabled=true
			 (m11y7).enabled=true
			 (m11y8).enabled=true
			 (m11y9).enabled=true
			 (m11y10).enabled=true
			 (m11y11).enabled=true
			 (m11y12).enabled=true
			 (m11y13).enabled=true
			 (m11y14).enabled=true
			
			 (m12y1).enabled=true
			 (m12y2).enabled=true
			 (m12y3).enabled=true
			 (m12y4).enabled=true
			 (m12y5).enabled=true
			 (m12y6).enabled=true
			 (m12y7).enabled=true
			 (m12y8).enabled=true
			 (m12y9).enabled=true
			 (m12y10).enabled=true
			 (m12y11).enabled=true
			 (m12y12).enabled=true
			 (m12y13).enabled=true
			 (m12y14).enabled=true
			
			 (m13y1).enabled=true
			 (m13y2).enabled=true
			 (m13y3).enabled=true
			 (m13y4).enabled=true
			 (m13y5).enabled=true
			 (m13y6).enabled=true
			 (m13y7).enabled=true
			 (m13y8).enabled=true
			 (m13y9).enabled=true
			 (m13y10).enabled=true
			 (m13y11).enabled=true
			 (m13y12).enabled=true
			 (m13y13).enabled=true
			 (m13y14).enabled=true
			
			 (m14y1).enabled=true
			 (m14y2).enabled=true
			 (m14y3).enabled=true
			 (m14y4).enabled=true
			 (m14y5).enabled=true
			 (m14y6).enabled=true
			 (m14y7).enabled=true
			 (m14y8).enabled=true
			 (m14y9).enabled=true
			 (m14y10).enabled=true
			 (m14y11).enabled=true
			 (m14y12).enabled=true
			 (m14y13).enabled=true
			 (m14y14).enabled=true
		)
		else (
			
			activa_personalizado.enabled = false
			desactiva_personalizado.enabled = false
	 (m1y1).enabled=false
	 (m1y2).enabled=false
	 (m1y3).enabled=false
	 (m1y4).enabled=false
	 (m1y5).enabled=false
	 (m1y6).enabled=false
	 (m1y7).enabled=false
	 (m1y8).enabled=false
	 (m1y9).enabled=false
	 (m1y10).enabled=false
	 (m1y11).enabled=false
	 (m1y12).enabled=false
	 (m1y13).enabled=false
	 (m1y14).enabled=false
	
	 (m2y1).enabled=false
	 (m2y2).enabled=false
	 (m2y3).enabled=false
	 (m2y4).enabled=false
	 (m2y5).enabled=false
	 (m2y6).enabled=false
	 (m2y7).enabled=false
	 (m2y8).enabled=false
	 (m2y9).enabled=false
	 (m2y10).enabled=false
	 (m2y11).enabled=false
	 (m2y12).enabled=false
	 (m2y13).enabled=false
	 (m2y14).enabled=false
	
		 	 (m3y1).enabled=false
	 (m3y2).enabled=false
	 (m3y3).enabled=false
	 (m3y4).enabled=false
	 (m3y5).enabled=false
	 (m3y6).enabled=false
	 (m3y7).enabled=false
	 (m3y8).enabled=false
	 (m3y9).enabled=false
	 (m3y10).enabled=false
	 (m3y11).enabled=false
	 (m3y12).enabled=false
	 (m3y13).enabled=false
	 (m3y14).enabled=false
	
	 (m4y1).enabled=false
	 (m4y2).enabled=false
	 (m4y3).enabled=false
	 (m4y4).enabled=false
	 (m4y5).enabled=false
	 (m4y6).enabled=false
	 (m4y7).enabled=false
	 (m4y8).enabled=false
	 (m4y9).enabled=false
	 (m4y10).enabled=false
	 (m4y11).enabled=false
	 (m4y12).enabled=false
	 (m4y13).enabled=false
	 (m4y14).enabled=false
	
	 (m5y1).enabled=false
	 (m5y2).enabled=false
	 (m5y3).enabled=false
	 (m5y4).enabled=false
	 (m5y5).enabled=false
	 (m5y6).enabled=false
	 (m5y7).enabled=false
	 (m5y8).enabled=false
	 (m5y9).enabled=false
	 (m5y10).enabled=false
	 (m5y11).enabled=false
	 (m5y12).enabled=false
	 (m5y13).enabled=false
	 (m5y14).enabled=false
	
	 (m6y1).enabled=false
	 (m6y2).enabled=false
	 (m6y3).enabled=false
	 (m6y4).enabled=false
	 (m6y5).enabled=false
	 (m6y6).enabled=false
	 (m6y7).enabled=false
	 (m6y8).enabled=false
	 (m6y9).enabled=false
	 (m6y10).enabled=false
	 (m6y11).enabled=false
	 (m6y12).enabled=false
	 (m6y13).enabled=false
	 (m6y14).enabled=false
	
	 (m7y1).enabled=false
	 (m7y2).enabled=false
	 (m7y3).enabled=false
	 (m7y4).enabled=false
	 (m7y5).enabled=false
	 (m7y6).enabled=false
	 (m7y7).enabled=false
	 (m7y8).enabled=false
	 (m7y9).enabled=false
	 (m7y10).enabled=false
	 (m7y11).enabled=false
	 (m7y12).enabled=false
	 (m7y13).enabled=false
	 (m7y14).enabled=false
	
	 (m8y1).enabled=false
	 (m8y2).enabled=false
	 (m8y3).enabled=false
	 (m8y4).enabled=false
	 (m8y5).enabled=false
	 (m8y6).enabled=false
	 (m8y7).enabled=false
	 (m8y8).enabled=false
	 (m8y9).enabled=false
	 (m8y10).enabled=false
	 (m8y11).enabled=false
	 (m8y12).enabled=false
	 (m8y13).enabled=false
	 (m8y14).enabled=false
	
	 (m9y1).enabled=false
	 (m9y2).enabled=false
	 (m9y3).enabled=false
	 (m9y4).enabled=false
	 (m9y5).enabled=false
	 (m9y6).enabled=false
	 (m9y7).enabled=false
	 (m9y8).enabled=false
	 (m9y9).enabled=false
	 (m9y10).enabled=false
	 (m9y11).enabled=false
	 (m9y12).enabled=false
	 (m9y13).enabled=false
	 (m9y14).enabled=false
	
	 (m10y1).enabled=false
	 (m10y2).enabled=false
	 (m10y3).enabled=false
	 (m10y4).enabled=false
	 (m10y5).enabled=false
	 (m10y6).enabled=false
	 (m10y7).enabled=false
	 (m10y8).enabled=false
	 (m10y9).enabled=false
	 (m10y10).enabled=false
	 (m10y11).enabled=false
	 (m10y12).enabled=false
	 (m10y13).enabled=false
	 (m10y14).enabled=false
	
	 (m11y1).enabled=false
	 (m11y2).enabled=false
	 (m11y3).enabled=false
	 (m11y4).enabled=false
	 (m11y5).enabled=false
	 (m11y6).enabled=false
	 (m11y7).enabled=false
	 (m11y8).enabled=false
	 (m11y9).enabled=false
	 (m11y10).enabled=false
	 (m11y11).enabled=false
	 (m11y12).enabled=false
	 (m11y13).enabled=false
	 (m11y14).enabled=false
	
	 (m12y1).enabled=false
	 (m12y2).enabled=false
	 (m12y3).enabled=false
	 (m12y4).enabled=false
	 (m12y5).enabled=false
	 (m12y6).enabled=false
	 (m12y7).enabled=false
	 (m12y8).enabled=false
	 (m12y9).enabled=false
	 (m12y10).enabled=false
	 (m12y11).enabled=false
	 (m12y12).enabled=false
	 (m12y13).enabled=false
	 (m12y14).enabled=false
	
	 (m13y1).enabled=false
	 (m13y2).enabled=false
	 (m13y3).enabled=false
	 (m13y4).enabled=false
	 (m13y5).enabled=false
	 (m13y6).enabled=false
	 (m13y7).enabled=false
	 (m13y8).enabled=false
	 (m13y9).enabled=false
	 (m13y10).enabled=false
	 (m13y11).enabled=false
	 (m13y12).enabled=false
	 (m13y13).enabled=false
	 (m13y14).enabled=false
	
	 (m14y1).enabled=false
	 (m14y2).enabled=false
	 (m14y3).enabled=false
	 (m14y4).enabled=false
	 (m14y5).enabled=false
	 (m14y6).enabled=false
	 (m14y7).enabled=false
	 (m14y8).enabled=false
	 (m14y9).enabled=false
	 (m14y10).enabled=false
	 (m14y11).enabled=false
	 (m14y12).enabled=false
	 (m14y13).enabled=false
	 (m14y14).enabled=false
		)
	)
	on activa_personalizado pressed do
	(
			if(personalizado.state==2) then(
				 	(m1y1).checked=true
				 (m1y2).checked=true
				 (m1y3).checked=true
				 (m1y4).checked=true
				 (m1y5).checked=true
				 (m1y6).checked=true
				 (m1y7).checked=true
				 (m1y8).checked=true
				 (m1y9).checked=true
				 (m1y10).checked=true
				 (m1y11).checked=true
				 (m1y12).checked=true
				 (m1y13).checked=true
				 (m1y14).checked=true
				
				 (m2y1).checked=true
				 (m2y2).checked=true
				 (m2y3).checked=true
				 (m2y4).checked=true
				 (m2y5).checked=true
				 (m2y6).checked=true
				 (m2y7).checked=true
				 (m2y8).checked=true
				 (m2y9).checked=true
				 (m2y10).checked=true
				 (m2y11).checked=true
				 (m2y12).checked=true
				 (m2y13).checked=true
				 (m2y14).checked=true
				
				(m3y1).checked=true
				 (m3y2).checked=true
				 (m3y3).checked=true
				 (m3y4).checked=true
				 (m3y5).checked=true
				 (m3y6).checked=true
				 (m3y7).checked=true
				 (m3y8).checked=true
				 (m3y9).checked=true
				 (m3y10).checked=true
				 (m3y11).checked=true
				 (m3y12).checked=true
				 (m3y13).checked=true
				 (m3y14).checked=true
				
				 (m4y1).checked=true
				 (m4y2).checked=true
				 (m4y3).checked=true
				 (m4y4).checked=true
				 (m4y5).checked=true
				 (m4y6).checked=true
				 (m4y7).checked=true
				 (m4y8).checked=true
				 (m4y9).checked=true
				 (m4y10).checked=true
				 (m4y11).checked=true
				 (m4y12).checked=true
				 (m4y13).checked=true
				 (m4y14).checked=true
				
				 (m5y1).checked=true
				 (m5y2).checked=true
				 (m5y3).checked=true
				 (m5y4).checked=true
				 (m5y5).checked=true
				 (m5y6).checked=true
				 (m5y7).checked=true
				 (m5y8).checked=true
				 (m5y9).checked=true
				 (m5y10).checked=true
				 (m5y11).checked=true
				 (m5y12).checked=true
				 (m5y13).checked=true
				 (m5y14).checked=true
				
				 (m6y1).checked=true
				 (m6y2).checked=true
				 (m6y3).checked=true
				 (m6y4).checked=true
				 (m6y5).checked=true
				 (m6y6).checked=true
				 (m6y7).checked=true
				 (m6y8).checked=true
				 (m6y9).checked=true
				 (m6y10).checked=true
				 (m6y11).checked=true
				 (m6y12).checked=true
				 (m6y13).checked=true
				 (m6y14).checked=true
				
				 (m7y1).checked=true
				 (m7y2).checked=true
				 (m7y3).checked=true
				 (m7y4).checked=true
				 (m7y5).checked=true
				 (m7y6).checked=true
				 (m7y7).checked=true
				 (m7y8).checked=true
				 (m7y9).checked=true
				 (m7y10).checked=true
				 (m7y11).checked=true
				 (m7y12).checked=true
				 (m7y13).checked=true
				 (m7y14).checked=true
				
				 (m8y1).checked=true
				 (m8y2).checked=true
				 (m8y3).checked=true
				 (m8y4).checked=true
				 (m8y5).checked=true
				 (m8y6).checked=true
				 (m8y7).checked=true
				 (m8y8).checked=true
				 (m8y9).checked=true
				 (m8y10).checked=true
				 (m8y11).checked=true
				 (m8y12).checked=true
				 (m8y13).checked=true
				 (m8y14).checked=true
				
				 (m9y1).checked=true
				 (m9y2).checked=true
				 (m9y3).checked=true
				 (m9y4).checked=true
				 (m9y5).checked=true
				 (m9y6).checked=true
				 (m9y7).checked=true
				 (m9y8).checked=true
				 (m9y9).checked=true
				 (m9y10).checked=true
				 (m9y11).checked=true
				 (m9y12).checked=true
				 (m9y13).checked=true
				 (m9y14).checked=true
				
				 (m10y1).checked=true
				 (m10y2).checked=true
				 (m10y3).checked=true
				 (m10y4).checked=true
				 (m10y5).checked=true
				 (m10y6).checked=true
				 (m10y7).checked=true
				 (m10y8).checked=true
				 (m10y9).checked=true
				 (m10y10).checked=true
				 (m10y11).checked=true
				 (m10y12).checked=true
				 (m10y13).checked=true
				 (m10y14).checked=true
				
				 (m11y1).checked=true
				 (m11y2).checked=true
				 (m11y3).checked=true
				 (m11y4).checked=true
				 (m11y5).checked=true
				 (m11y6).checked=true
				 (m11y7).checked=true
				 (m11y8).checked=true
				 (m11y9).checked=true
				 (m11y10).checked=true
				 (m11y11).checked=true
				 (m11y12).checked=true
				 (m11y13).checked=true
				 (m11y14).checked=true
				
				 (m12y1).checked=true
				 (m12y2).checked=true
				 (m12y3).checked=true
				 (m12y4).checked=true
				 (m12y5).checked=true
				 (m12y6).checked=true
				 (m12y7).checked=true
				 (m12y8).checked=true
				 (m12y9).checked=true
				 (m12y10).checked=true
				 (m12y11).checked=true
				 (m12y12).checked=true
				 (m12y13).checked=true
				 (m12y14).checked=true
				
				 (m13y1).checked=true
				 (m13y2).checked=true
				 (m13y3).checked=true
				 (m13y4).checked=true
				 (m13y5).checked=true
				 (m13y6).checked=true
				 (m13y7).checked=true
				 (m13y8).checked=true
				 (m13y9).checked=true
				 (m13y10).checked=true
				 (m13y11).checked=true
				 (m13y12).checked=true
				 (m13y13).checked=true
				 (m13y14).checked=true
				
				 (m14y1).checked=true
				 (m14y2).checked=true
				 (m14y3).checked=true
				 (m14y4).checked=true
				 (m14y5).checked=true
				 (m14y6).checked=true
				 (m14y7).checked=true
				 (m14y8).checked=true
				 (m14y9).checked=true
				 (m14y10).checked=true
				 (m14y11).checked=true
				 (m14y12).checked=true
				 (m14y13).checked=true
				 (m14y14).checked=true
			)
			else(
				messageBox("Solo puedes activarlo todo cuando vayas a personalizar tu mapa")
			)
		)
	on desactiva_personalizado pressed do
	(
			if(personalizado.state==2) then(
				 	(m1y1).checked=false
				 (m1y2).checked=false
				 (m1y3).checked=false
				 (m1y4).checked=false
				 (m1y5).checked=false
				 (m1y6).checked=false
				 (m1y7).checked=false
				 (m1y8).checked=false
				 (m1y9).checked=false
				 (m1y10).checked=false
				 (m1y11).checked=false
				 (m1y12).checked=false
				 (m1y13).checked=false
				 (m1y14).checked=false
				
				 (m2y1).checked=false
				 (m2y2).checked=false
				 (m2y3).checked=false
				 (m2y4).checked=false
				 (m2y5).checked=false
				 (m2y6).checked=false
				 (m2y7).checked=false
				 (m2y8).checked=false
				 (m2y9).checked=false
				 (m2y10).checked=false
				 (m2y11).checked=false
				 (m2y12).checked=false
				 (m2y13).checked=false
				 (m2y14).checked=false
				
				(m3y1).checked=false
				 (m3y2).checked=false
				 (m3y3).checked=false
				 (m3y4).checked=false
				 (m3y5).checked=false
				 (m3y6).checked=false
				 (m3y7).checked=false
				 (m3y8).checked=false
				 (m3y9).checked=false
				 (m3y10).checked=false
				 (m3y11).checked=false
				 (m3y12).checked=false
				 (m3y13).checked=false
				 (m3y14).checked=false
				
				 (m4y1).checked=false
				 (m4y2).checked=false
				 (m4y3).checked=false
				 (m4y4).checked=false
				 (m4y5).checked=false
				 (m4y6).checked=false
				 (m4y7).checked=false
				 (m4y8).checked=false
				 (m4y9).checked=false
				 (m4y10).checked=false
				 (m4y11).checked=false
				 (m4y12).checked=false
				 (m4y13).checked=false
				 (m4y14).checked=false
				
				 (m5y1).checked=false
				 (m5y2).checked=false
				 (m5y3).checked=false
				 (m5y4).checked=false
				 (m5y5).checked=false
				 (m5y6).checked=false
				 (m5y7).checked=false
				 (m5y8).checked=false
				 (m5y9).checked=false
				 (m5y10).checked=false
				 (m5y11).checked=false
				 (m5y12).checked=false
				 (m5y13).checked=false
				 (m5y14).checked=false
				
				 (m6y1).checked=false
				 (m6y2).checked=false
				 (m6y3).checked=false
				 (m6y4).checked=false
				 (m6y5).checked=false
				 (m6y6).checked=false
				 (m6y7).checked=false
				 (m6y8).checked=false
				 (m6y9).checked=false
				 (m6y10).checked=false
				 (m6y11).checked=false
				 (m6y12).checked=false
				 (m6y13).checked=false
				 (m6y14).checked=false
				
				 (m7y1).checked=false
				 (m7y2).checked=false
				 (m7y3).checked=false
				 (m7y4).checked=false
				 (m7y5).checked=false
				 (m7y6).checked=false
				 (m7y7).checked=false
				 (m7y8).checked=false
				 (m7y9).checked=false
				 (m7y10).checked=false
				 (m7y11).checked=false
				 (m7y12).checked=false
				 (m7y13).checked=false
				 (m7y14).checked=false
				
				 (m8y1).checked=false
				 (m8y2).checked=false
				 (m8y3).checked=false
				 (m8y4).checked=false
				 (m8y5).checked=false
				 (m8y6).checked=false
				 (m8y7).checked=false
				 (m8y8).checked=false
				 (m8y9).checked=false
				 (m8y10).checked=false
				 (m8y11).checked=false
				 (m8y12).checked=false
				 (m8y13).checked=false
				 (m8y14).checked=false
				
				 (m9y1).checked=false
				 (m9y2).checked=false
				 (m9y3).checked=false
				 (m9y4).checked=false
				 (m9y5).checked=false
				 (m9y6).checked=false
				 (m9y7).checked=false
				 (m9y8).checked=false
				 (m9y9).checked=false
				 (m9y10).checked=false
				 (m9y11).checked=false
				 (m9y12).checked=false
				 (m9y13).checked=false
				 (m9y14).checked=false
				
				 (m10y1).checked=false
				 (m10y2).checked=false
				 (m10y3).checked=false
				 (m10y4).checked=false
				 (m10y5).checked=false
				 (m10y6).checked=false
				 (m10y7).checked=false
				 (m10y8).checked=false
				 (m10y9).checked=false
				 (m10y10).checked=false
				 (m10y11).checked=false
				 (m10y12).checked=false
				 (m10y13).checked=false
				 (m10y14).checked=false
				
				 (m11y1).checked=false
				 (m11y2).checked=false
				 (m11y3).checked=false
				 (m11y4).checked=false
				 (m11y5).checked=false
				 (m11y6).checked=false
				 (m11y7).checked=false
				 (m11y8).checked=false
				 (m11y9).checked=false
				 (m11y10).checked=false
				 (m11y11).checked=false
				 (m11y12).checked=false
				 (m11y13).checked=false
				 (m11y14).checked=false
				
				 (m12y1).checked=false
				 (m12y2).checked=false
				 (m12y3).checked=false
				 (m12y4).checked=false
				 (m12y5).checked=false
				 (m12y6).checked=false
				 (m12y7).checked=false
				 (m12y8).checked=false
				 (m12y9).checked=false
				 (m12y10).checked=false
				 (m12y11).checked=false
				 (m12y12).checked=false
				 (m12y13).checked=false
				 (m12y14).checked=false
				
				 (m13y1).checked=false
				 (m13y2).checked=false
				 (m13y3).checked=false
				 (m13y4).checked=false
				 (m13y5).checked=false
				 (m13y6).checked=false
				 (m13y7).checked=false
				 (m13y8).checked=false
				 (m13y9).checked=false
				 (m13y10).checked=false
				 (m13y11).checked=false
				 (m13y12).checked=false
				 (m13y13).checked=false
				 (m13y14).checked=false
				
				 (m14y1).checked=false
				 (m14y2).checked=false
				 (m14y3).checked=false
				 (m14y4).checked=false
				 (m14y5).checked=false
				 (m14y6).checked=false
				 (m14y7).checked=false
				 (m14y8).checked=false
				 (m14y9).checked=false
				 (m14y10).checked=false
				 (m14y11).checked=false
				 (m14y12).checked=false
				 (m14y13).checked=false
				 (m14y14).checked=false
			)
			else(
				messageBox("Solo puedes desactivarlo todo cuando vayas a personalizar tu mapa")
			)
		)
	on crearMapa pressed do
	(
		local material_pared = false
		
		
		local	suelo = plane length:tam_mapa width:tam_mapa
			suelo.pos = [Xmapa, Ymapa, Zmapa]
	
		
		if(radio_material.state==1 or (radio_material.state==2 and matSuelo == undefined)) then (
			if (radio_material.state==2 and matSuelo == undefined) then (
				messageBox("Elegiste la opción material para el suelo y no añadiste ninguno (se mostrará el material por defecto)")
			)
			suelo.material = $aux_suelo.material
			addmodifier suelo (UVWMap Length:3 Width:3)
		)
		else if (radio_material.state==2) then (
				suelo.material = matSuelo
		)
		else if (radio_material.state==3) then (
			suelo.wirecolor = color_suelo
		)
		
		local filitas
		
		
		if (personalizado.state == 1) then (
			filitas = 20
			local numerito = random 1 4
			
		if(numerito == 1) then(
			messageBox("Se ha creado un mapa aleatorio #Nivel 3")
			m = #()
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
			append m #(1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1)
			append m #(1,0,1,1,0,1,1,1,0,0,0,0,1,1,1,0,1,1,0,1)
			append m #(1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,1,1,1,0,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1)
			append m #(1,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1)
			append m #(1,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1)
			append m #(1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1)
			append m #(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1)
			append m #(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1)
			append m #(1,0,0,0,0,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1)
			append m #(1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1)
			append m #(1,0,1,1,0,1,0,0,1,1,1,1,1,0,1,0,1,1,0,1)
			append m #(1,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,0,0,0,1)
			append m #(1,0,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
		)
		else if (numerito == 2) then (
			messageBox("Se ha creado un mapa aleatorio #Nivel 2")
			m = #()
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
			append m #(1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,0,0,1,0,1,0,0,0,0,1,0,1,0,1,1,0,1)
			append m #(1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1,0,1)
			append m #(1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1)
			append m #(1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1)
			append m #(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1)
			append m #(1,0,0,0,0,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1)
			append m #(1,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1)
			append m #(1,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1)
			append m #(1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1)
			append m #(1,1,1,1,0,0,0,1,0,1,1,0,1,0,0,0,1,1,1,1)
			append m #(1,1,1,1,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1)
			append m #(1,0,0,0,0,1,0,1,1,0,1,0,1,1,0,0,0,0,0,1)
			append m #(1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1)
			append m #(1,0,1,1,0,1,0,0,1,1,1,1,1,0,1,0,1,1,0,1)
			append m #(1,0,0,0,0,1,0,0,0,1,1,1,0,0,1,0,0,0,0,1)
			append m #(1,0,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
			
		)
		else if(numerito==3) then (
			messageBox("Se ha creado un mapa aleatorio #Nivel 1")
			m = #()
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,1,0,1,0,1,0,1,1,1,1,0,1,0,1,0,1,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1)
			append m #(1,0,1,0,1,1,0,1,1,0,0,1,1,0,1,1,0,1,0,1)
			append m #(1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1)
			append m #(1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1)
			append m #(1,0,0,0,1,1,1,1,1,0,0,1,1,1,0,1,0,0,0,1)
			append m #(1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1)
			append m #(1,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,1)
			append m #(1,0,1,0,1,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1)
			append m #(1,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,0,1)
			append m #(1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,1,0,1,0,1)
			append m #(1,0,0,0,1,1,0,1,1,1,0,1,1,0,1,1,0,0,0,1)
			append m #(1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1)
			append m #(1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1)
			append m #(1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1)
			append m #(1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
		) else if(numerito == 4) then (
		messageBox("Se ha creado un mapa aleatorio #Nivel 4")
			m = #()
			append	m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,0,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1)
			append m #(1,0,0,1,1,0,0,0,1,1,1,0,0,0,0,1,1,0,0,1)
			append m #(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
			append m #(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
		
		)
		)
		 else (
			 m = #()
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 append m #(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
			 filitas = 14
			messageBox("Se ha creado un mapa personalizado")
			 if((m1y1).checked) then (m[1][1]=1)
	 if((m1y2).checked) then (m[1][2]=1)
	 if((m1y3).checked) then (m[1][3]=1)
	 if((m1y4).checked) then (m[1][4]=1)
	 if((m1y5).checked) then (m[1][5]=1)
	 if((m1y6).checked) then (m[1][6]=1)
	 if((m1y7).checked) then (m[1][7]=1)
	 if((m1y8).checked) then (m[1][8]=1)
	 if((m1y9).checked) then (m[1][9]=1)
	 if((m1y10).checked) then (m[1][10]=1)
	 if((m1y11).checked) then (m[1][11]=1)
	 if((m1y12).checked) then (m[1][12]=1)
	 if((m1y13).checked) then (m[1][13]=1)
	 if((m1y14).checked) then (m[1][14]=1)
	
	 if((m2y1).checked) then (m[2][1]=1)
	 if((m2y2).checked) then (m[2][2]=1)
	 if((m2y3).checked) then (m[2][3]=1)
	 if((m2y4).checked) then (m[2][4]=1)
	 if((m2y5).checked) then (m[2][5]=1)
	 if((m2y6).checked) then (m[2][6]=1)
	 if((m2y7).checked) then (m[2][7]=1)
	 if((m2y8).checked) then (m[2][8]=1)
	 if((m2y9).checked) then (m[2][9]=1)
	 if((m2y10).checked) then (m[2][10]=1)
	 if((m2y11).checked) then (m[2][11]=1)
	 if((m2y12).checked) then (m[2][12]=1)
	 if((m2y13).checked) then (m[2][13]=1)
	 if((m2y14).checked) then (m[2][14]=1)
	
	if((m3y1).checked) then (m[3][1]=1)
	 if((m3y2).checked) then (m[3][2]=1)
	 if((m3y3).checked) then (m[3][3]=1)
	 if((m3y4).checked) then (m[3][4]=1)
	 if((m3y5).checked) then (m[3][5]=1)
	 if((m3y6).checked) then (m[3][6]=1)
	 if((m3y7).checked) then (m[3][7]=1)
	 if((m3y8).checked) then (m[3][8]=1)
	 if((m3y9).checked) then (m[3][9]=1)
	 if((m3y10).checked) then (m[3][10]=1)
	 if((m3y11).checked) then (m[3][11]=1)
	 if((m3y12).checked) then (m[3][12]=1)
	 if((m3y13).checked) then (m[3][13]=1)
	 if((m3y14).checked) then (m[3][14]=1)
	
	 if((m4y1).checked) then (m[4][1]=1)
	 if((m4y2).checked) then (m[4][2]=1)
	 if((m4y3).checked) then (m[4][3]=1)
	 if((m4y4).checked) then (m[4][4]=1)
	 if((m4y5).checked) then (m[4][5]=1)
	 if((m4y6).checked) then (m[4][6]=1)
	 if((m4y7).checked) then (m[4][7]=1)
	 if((m4y8).checked) then (m[4][8]=1)
	 if((m4y9).checked) then (m[4][9]=1)
	 if((m4y10).checked) then (m[4][10]=1)
	 if((m4y11).checked) then (m[4][11]=1)
	 if((m4y12).checked) then (m[4][12]=1)
	 if((m4y13).checked) then (m[4][13]=1)
	 if((m4y14).checked) then (m[4][14]=1)
	
	 if((m5y1).checked) then (m[5][1]=1)
	 if((m5y2).checked) then (m[5][2]=1)
	 if((m5y3).checked) then (m[5][3]=1)
	 if((m5y4).checked) then (m[5][4]=1)
	 if((m5y5).checked) then (m[5][5]=1)
	 if((m5y6).checked) then (m[5][6]=1)
	 if((m5y7).checked) then (m[5][7]=1)
	 if((m5y8).checked) then (m[5][8]=1)
	 if((m5y9).checked) then (m[5][9]=1)
	 if((m5y10).checked) then (m[5][10]=1)
	 if((m5y11).checked) then (m[5][11]=1)
	 if((m5y12).checked) then (m[5][12]=1)
	 if((m5y13).checked) then (m[5][13]=1)
	 if((m5y14).checked) then (m[5][14]=1)
	
	 if((m6y1).checked) then (m[6][1]=1)
	 if((m6y2).checked) then (m[6][2]=1)
	 if((m6y3).checked) then (m[6][3]=1)
	 if((m6y4).checked) then (m[6][4]=1)
	 if((m6y5).checked) then (m[6][5]=1)
	 if((m6y6).checked) then (m[6][6]=1)
	 if((m6y7).checked) then (m[6][7]=1)
	 if((m6y8).checked) then (m[6][8]=1)
	 if((m6y9).checked) then (m[6][9]=1)
	 if((m6y10).checked) then (m[6][10]=1)
	 if((m6y11).checked) then (m[6][11]=1)
	 if((m6y12).checked) then (m[6][12]=1)
	 if((m6y13).checked) then (m[6][13]=1)
	 if((m6y14).checked) then (m[6][14]=1)
	
	 if((m7y1).checked) then (m[7][1]=1)
	 if((m7y2).checked) then (m[7][2]=1)
	 if((m7y3).checked) then (m[7][3]=1)
	 if((m7y4).checked) then (m[7][4]=1)
	 if((m7y5).checked) then (m[7][5]=1)
	 if((m7y6).checked) then (m[7][6]=1)
	 if((m7y7).checked) then (m[7][7]=1)
	 if((m7y8).checked) then (m[7][8]=1)
	 if((m7y9).checked) then (m[7][9]=1)
	 if((m7y10).checked) then (m[7][10]=1)
	 if((m7y11).checked) then (m[7][11]=1)
	 if((m7y12).checked) then (m[7][12]=1)
	 if((m7y13).checked) then (m[7][13]=1)
	 if((m7y14).checked) then (m[7][14]=1)
	
	 if((m8y1).checked) then (m[8][1]=1)
	 if((m8y2).checked) then (m[8][2]=1)
	 if((m8y3).checked) then (m[8][3]=1)
	 if((m8y4).checked) then (m[8][4]=1)
	 if((m8y5).checked) then (m[8][5]=1)
	 if((m8y6).checked) then (m[8][6]=1)
	 if((m8y7).checked) then (m[8][7]=1)
	 if((m8y8).checked) then (m[8][8]=1)
	 if((m8y9).checked) then (m[8][9]=1)
	 if((m8y10).checked) then (m[8][10]=1)
	 if((m8y11).checked) then (m[8][11]=1)
	 if((m8y12).checked) then (m[8][12]=1)
	 if((m8y13).checked) then (m[8][13]=1)
	 if((m8y14).checked) then (m[8][14]=1)
	
	 if((m9y1).checked) then (m[9][1]=1)
	 if((m9y2).checked) then (m[9][2]=1)
	 if((m9y3).checked) then (m[9][3]=1)
	 if((m9y4).checked) then (m[9][4]=1)
	 if((m9y5).checked) then (m[9][5]=1)
	 if((m9y6).checked) then (m[9][6]=1)
	 if((m9y7).checked) then (m[9][7]=1)
	 if((m9y8).checked) then (m[9][8]=1)
	 if((m9y9).checked) then (m[9][9]=1)
	 if((m9y10).checked) then (m[9][10]=1)
	 if((m9y11).checked) then (m[9][11]=1)
	 if((m9y12).checked) then (m[9][12]=1)
	 if((m9y13).checked) then (m[9][13]=1)
	 if((m9y14).checked) then (m[9][14]=1)
	
	 if((m10y1).checked) then (m[10][1]=1)
	 if((m10y2).checked) then (m[10][2]=1)
	 if((m10y3).checked) then (m[10][3]=1)
	 if((m10y4).checked) then (m[10][4]=1)
	 if((m10y5).checked) then (m[10][5]=1)
	 if((m10y6).checked) then (m[10][6]=1)
	 if((m10y7).checked) then (m[10][7]=1)
	 if((m10y8).checked) then (m[10][8]=1)
	 if((m10y9).checked) then (m[10][9]=1)
	 if((m10y10).checked) then (m[10][10]=1)
	 if((m10y11).checked) then (m[10][11]=1)
	 if((m10y12).checked) then (m[10][12]=1)
	 if((m10y13).checked) then (m[10][13]=1)
	 if((m10y14).checked) then (m[10][14]=1)
	
	 if((m11y1).checked) then (m[11][1]=1)
	 if((m11y2).checked) then (m[11][2]=1)
	 if((m11y3).checked) then (m[11][3]=1)
	 if((m11y4).checked) then (m[11][4]=1)
	 if((m11y5).checked) then (m[11][5]=1)
	 if((m11y6).checked) then (m[11][6]=1)
	 if((m11y7).checked) then (m[11][7]=1)
	 if((m11y8).checked) then (m[11][8]=1)
	 if((m11y9).checked) then (m[11][9]=1)
	 if((m11y10).checked) then (m[11][10]=1)
	 if((m11y11).checked) then (m[11][11]=1)
	 if((m11y12).checked) then (m[11][12]=1)
	 if((m11y13).checked) then (m[11][13]=1)
	 if((m11y14).checked) then (m[11][14]=1)
	
	 if((m12y1).checked) then (m[12][1]=1)
	 if((m12y2).checked) then (m[12][2]=1)
	 if((m12y3).checked) then (m[12][3]=1)
	 if((m12y4).checked) then (m[12][4]=1)
	 if((m12y5).checked) then (m[12][5]=1)
	 if((m12y6).checked) then (m[12][6]=1)
	 if((m12y7).checked) then (m[12][7]=1)
	 if((m12y8).checked) then (m[12][8]=1)
	 if((m12y9).checked) then (m[12][9]=1)
	 if((m12y10).checked) then (m[12][10]=1)
	 if((m12y11).checked) then (m[12][11]=1)
	 if((m12y12).checked) then (m[12][12]=1)
	 if((m12y13).checked) then (m[12][13]=1)
	 if((m12y14).checked) then (m[12][14]=1)
	
	 if((m13y1).checked) then (m[13][1]=1)
	 if((m13y2).checked) then (m[13][2]=1)
	 if((m13y3).checked) then (m[13][3]=1)
	 if((m13y4).checked) then (m[13][4]=1)
	 if((m13y5).checked) then (m[13][5]=1)
	 if((m13y6).checked) then (m[13][6]=1)
	 if((m13y7).checked) then (m[13][7]=1)
	 if((m13y8).checked) then (m[13][8]=1)
	 if((m13y9).checked) then (m[13][9]=1)
	 if((m13y10).checked) then (m[13][10]=1)
	 if((m13y11).checked) then (m[13][11]=1)
	 if((m13y12).checked) then (m[13][12]=1)
	 if((m13y13).checked) then (m[13][13]=1)
	 if((m13y14).checked) then (m[13][14]=1)
	
	 if((m14y1).checked) then (m[14][1]=1)
	 if((m14y2).checked) then (m[14][2]=1)
	 if((m14y3).checked) then (m[14][3]=1)
	 if((m14y4).checked) then (m[14][4]=1)
	 if((m14y5).checked) then (m[14][5]=1)
	 if((m14y6).checked) then (m[14][6]=1)
	 if((m14y7).checked) then (m[14][7]=1)
	 if((m14y8).checked) then (m[14][8]=1)
	 if((m14y9).checked) then (m[14][9]=1)
	 if((m14y10).checked) then (m[14][10]=1)
	 if((m14y11).checked) then (m[14][11]=1)
	 if((m14y12).checked) then (m[14][12]=1)
	 if((m14y13).checked) then (m[14][13]=1)
	 if((m14y14).checked) then (m[14][14]=1)
		)
		
		local tam_bloque 
		if(personalizado.state == 1) then(
			 tam_bloque =tam_mapa * 0.05
		)
		else (
			tam_bloque =tam_mapa * 0.0714285
		)
		local mostrar_error_mat_sin_poner = f
		
		for i = 1 to filitas do (
			for j = 1 to filitas do (
				
				if(m[i][j] == 1) then (
					
					local pared  = box length:tam_bloque width:tam_bloque height:tam_pared
					pared.pos = [Xmapa+(tam_mapa*0.5)-(i*tam_bloque)+(tam_bloque*0.5),Ymapa+(tam_mapa*0.5)+(tam_bloque*0.5)- (j*tam_bloque),Zmapa]
					
					if(radio_material_pared.state==1 or (radio_material_pared.state==2 and matPared == undefined)) then (
		
							if (radio_material_pared.state==2 and matPared == undefined) then (
								mostrar_error_mat_sin_poner = true
								
							)
							pared.material = $aux_pared.material
							addmodifier pared (UVWMap maptype:5 Length:3 Width:3 Height:3)
							
					)
					else if (radio_material_pared.state==2) then (
								pared.material = matPared
					)
					else if (radio_material.state==3) then (
							pared.wirecolor = color_pared
					)
					
				)
				else (
					local coco = Sphere radius:(tam_bloque*0.1)
					coco.pos = [Xmapa+(tam_mapa*0.5)-(i*tam_bloque)+(tam_bloque*0.5),Ymapa+(tam_mapa*0.5)+(tam_bloque*0.5)- (j*tam_bloque),Zmapa+(tam_pared*0.4)]
					coco.wirecolor = white
				)
			)
		)
		if (mostrar_error_mat_sin_poner == true) then(
			messageBox("Elegiste la opción material para las paredes y no añadiste ninguno (se mostrará el material por defecto)")
		)
	)
)

CreateDialog come 

AddSubRollout come.rollDentro inmune

AddSubRollout come.rollDentro mata_fantasma

AddSubRollout come.rollDentro mapa



