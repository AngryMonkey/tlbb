--����NPC
--���д�����1
x018030_g_scriptId=018030

x018030_g_city0 = 205
x018030_g_city1 = 223
x018030_g_city2 = 597
x018030_g_city3 = 615

--**********************************

--�¼��������

--**********************************

function x018030_OnDefaultEvent( sceneId, selfId,targetId )

	strCity0Name = CityGetCityName(sceneId, selfId, x018030_g_city0)
	strCity1Name = CityGetCityName(sceneId, selfId, x018030_g_city1)
	strCity2Name = CityGetCityName(sceneId, selfId, x018030_g_city2)
	strCity3Name = CityGetCityName(sceneId, selfId, x018030_g_city3)


	BeginEvent(sceneId)

		AddText(sceneId,"��ʲô�ҿ��԰������")
		
		if(strCity0Name ~= "") then AddNumText(sceneId,x018030_g_scriptId,"����1  "..strCity0Name,9,0) end
		if(strCity1Name ~= "") then AddNumText(sceneId,x018030_g_scriptId,"����2  "..strCity1Name,9,1) end
		if(strCity2Name ~= "") then AddNumText(sceneId,x018030_g_scriptId,"����3  "..strCity2Name,9,2) end
		if(strCity3Name ~= "") then AddNumText(sceneId,x018030_g_scriptId,"����4  "..strCity3Name,9,3) end

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************

--�¼��б�ѡ��һ��

--**********************************

function x018030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if	(GetNumText()==0)	then	CityMoveToScene(sceneId, selfId, x018030_g_city0, 99, 152)
	elseif	(GetNumText()==1)	then	CityMoveToScene(sceneId, selfId, x018030_g_city1, 99, 152)
	elseif	(GetNumText()==2)	then	CityMoveToScene(sceneId, selfId, x018030_g_city2, 99, 152)
	elseif	(GetNumText()==3)	then	CityMoveToScene(sceneId, selfId, x018030_g_city3, 99, 152)
	end

end
