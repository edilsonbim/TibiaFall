function onAdvance(cid, skill, oldlevel, newlevel)
local vocationid = cid:getVocation():getId()
	       	if getPlayerLevel(cid) >= 10 and getPlayerStorageValue(cid, 99963) ~= 1 then

			       			if vocationid == 1 then
			       			doPlayerAddItem(cid, 7618, 5)
		    				elseif vocationid == 2 then
		   					doPlayerAddItem(cid, 2544, 100)
		   					elseif vocationid == 3 then
		     				doPlayerAddItem(cid, 2303, 50)
		     				doPlayerAddItem(cid, 2279, 50)
		    				elseif vocationid == 4 then
		     				doPlayerAddItem(cid, 2295, 50)
		     				doPlayerAddItem(cid, 2273, 50)
		     				end
						    setPlayerStorageValue(cid, 99963, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received rewards for advancing to Level 10.")

		    elseif getPlayerLevel(cid) >= 20 and getPlayerStorageValue(cid, 99964) ~= 1 then
		    				if vocationid == 1 then
			       			doPlayerAddItem(cid, 7618, 5)
		    				elseif vocationid == 2 then
		   					doPlayerAddItem(cid, 23723, 100)
		   					elseif vocationid == 3 then
		     				doPlayerAddItem(cid, 7620, 5)
		    				elseif vocationid == 4 then
		     				doPlayerAddItem(cid, 7620, 5)
		     				end
						    setPlayerStorageValue(cid, 99964, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received rewards for advancing to Level 20.")
		   elseif getPlayerLevel(cid) >= 30 and getPlayerStorageValue(cid, 99965) ~= 1 then
		  				 	if vocationid == 1 then
			       			doPlayerAddItem(cid, 2310, 100)
		    				elseif vocationid == 2 then
		   					doPlayerAddItem(cid, 2292, 100)
		   					elseif vocationid == 3 then
		     				doPlayerAddItem(cid, 7620, 5)
		    				elseif vocationid == 4 then
		     				doPlayerAddItem(cid, 2265, 100)
		     				end
						    setPlayerStorageValue(cid, 99965, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received rewards for advancing to Level 30.")
		     elseif getPlayerLevel(cid) >= 40 and getPlayerStorageValue(cid, 99966) ~= 1 then
		     				if vocationid == 1 then
			       			doPlayerAddItem(cid, 2313, 100)
		    				elseif vocationid == 2 then
		   					doPlayerAddItem(cid, 23723, 100)
		   					elseif vocationid == 3 then
		     				doPlayerAddItem(cid, 2278, 50)
		     				doPlayerAddItem(cid, 2304, 50)
		    				elseif vocationid == 4 then
		     				doPlayerAddItem(cid, 2295, 100)
		     				end
						    setPlayerStorageValue(cid, 99966, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received rewards for advancing to Level 40.")
			elseif getPlayerLevel(cid) >= 50 and getPlayerStorageValue(cid, 99969) ~= 1 then
							if vocationid == 1 then
			       			doPlayerAddItem(cid, 7618, 5)
		    				elseif vocationid == 2 then
		   					doPlayerAddItem(cid, 2288, 100)
		   					elseif vocationid == 3 then
		     				doPlayerAddItem(cid, 2274, 100)
		    				elseif vocationid == 4 then
		     				doPlayerAddItem(cid, 7620, 5)
		     				end
						    setPlayerStorageValue(cid, 99969, 1)
						   doPlayerSendTextMessage(cid, 19, "You have received rewards for advancing to Level 50.")


						    end
		    return true
end
