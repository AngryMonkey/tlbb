--物品公用脚本

x330000_g_scriptId = 330000;

--**********************************
--燃放烟花的时候玩家有几率获得一颗宝石
--**********************************
x330000_g_yianHuaBaoshi_dropRate_cur = 25;		--玩家在燃放烟花的时候，有2.5％的几率获得一颗宝石。
x330000_g_yianHuaBaoshi_dropRate_max = 1000;

x330000_g_yianHuaBaoshi_gems = {{gemId=50101001, rate=25},
							{gemId=50101002, rate=25},
							{gemId=50111001, rate=25},
							{gemId=50111002, rate=25}
						};

function x330000_YianhuaDuihuanBaoshi(sceneId, selfId)
	local randValue = random(x330000_g_yianHuaBaoshi_dropRate_max);
	if randValue <= x330000_g_yianHuaBaoshi_dropRate_cur then
		local gemTemp;
		local totalRate = 0;
		for _, gemTemp in x330000_g_yianHuaBaoshi_gems do
			totalRate = totalRate + gemTemp.rate;
		end
		
		local gemRandValue = random(totalRate);
		for _, gemTemp in x330000_g_yianHuaBaoshi_gems do
			if gemRandValue <= gemTemp.rate then
				BeginAddItem(sceneId);
				AddItem(sceneId, gemTemp.gemId, 1);
				ret = EndAddItem(sceneId, selfId);
				if ret > 0 then
					AddItemListToHuman(sceneId, selfId);
					
					--获得物品信息
	        local ItemInfo = GetItemTransfer(sceneId,selfId,0)

					local message;
					local randMessage = random(3);
					if randMessage == 1 then
						message = format("#W#{_INFOUSR%s}#I在燃放烟花时，不小心被烟花射出的一颗#cB3DB35#{_INFOMSG%s}#I给打中了脸。", LuaFnGetName(sceneId, selfId), ItemInfo);
					elseif randMessage == 2 then
						message = format("#W#{_INFOUSR%s}#I燃放完烟花意犹未尽，在拨拉烟花的灰烬时，突然发现了一颗#cB3DB35#{_INFOMSG%s}#I。", LuaFnGetName(sceneId, selfId), ItemInfo);
					else
						message = format("#W#{_INFOUSR%s}#I发现了一个哑火的烟花，正准备丢的时候，从烟花中滑出了一颗#cB3DB35#{_INFOMSG%s}#I。", LuaFnGetName(sceneId, selfId), ItemInfo);
					end
					BroadMsgByChatPipe(sceneId, selfId, message, 4);
				end
				return
			end
			gemRandValue = gemRandValue - gemTemp.rate;
		end
	end
end
