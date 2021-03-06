/*
//////////////////////////////////////

Choking

	Very very noticable.
	Lowers resistance.
	Decreases stage speed.
	Decreases transmittablity tremendously.
	Moderate Level.

Bonus
	Inflicts spikes of oxyloss

//////////////////////////////////////
*/

/datum/symptom/choking

	name = "Choking"
	stealth = -3
	resistance = -2
	stage_speed = -2
	transmittable = -4
	level = 3
	severity = 3

/datum/symptom/choking/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(1, 2)
				M << "<span class='warning'>[pick("You're having difficulty breathing.", "Your breathing becomes heavy.")]</span>"
			if(3, 4)
				M << "<span class='warning'><b>[pick("Your windpipe feels like a straw.", "Your breathing becomes tremendously difficult.")]</span>"
				M.adjustOxyLoss(5)
				M.emote("gasp")
			else
				M << "<span class='userdanger'>[pick("You're choking!", "You can't breathe!")]</span>"
				M.adjustOxyLoss(20)
				M.emote("gasp")
	return