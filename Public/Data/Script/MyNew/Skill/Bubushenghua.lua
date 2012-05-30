--½Å±¾ºÅ
x808230_g_scriptId = 808230

x808230_BuBu =139
x808230_BuBu_F =217
x808230_BuBu_G =317
x808230_Gong = 36
x808230_Fang = 35

function x808230_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end
--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 29629, 0 )
	local x,z = GetWorldPos( sceneId, selfId )
	local type = 0	--Õý³£×´Ì¬
	if LuaFnHaveImpactInSpecificCollection(sceneId, selfId, x808230_Gong)==1 then
		type=1  --¹¥»÷×´Ì¬
	elseif LuaFnHaveImpactInSpecificCollection(sceneId, selfId, x808230_Fang)==1 then
		type=2  --·ÀÓù×´Ì¬
	end
	if type==1 then
		CreateSpecialObjByDataIndex(sceneId, selfId, x808230_BuBu_G+x808230_XinFaAddition( sceneId, selfId ), x, z, 0)
	elseif type==2 then
		CreateSpecialObjByDataIndex(sceneId, selfId, x808230_BuBu_F+x808230_XinFaAddition( sceneId, selfId ), x, z, 0)
	else
		CreateSpecialObjByDataIndex(sceneId, selfId, x808230_BuBu+x808230_XinFaAddition( sceneId, selfId ), x, z, 0)
	end
end

--**********************************
-- ÐÄ·¨¼Ó³É
--**********************************
function x808230_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 63)
	local nAdditon = 0
	if nXinfaLevel>=150 then
		nAdditon = 15
	elseif nXinfaLevel>=140 and nXinfaLevel<150 then
		nAdditon = 14
	elseif nXinfaLevel>=130 and nXinfaLevel<140 then
		nAdditon = 13
	elseif nXinfaLevel>=120 and nXinfaLevel<130 then
		nAdditon = 12
	elseif nXinfaLevel>=110 and nXinfaLevel<120 then
		nAdditon = 11
	elseif nXinfaLevel>=100 and nXinfaLevel<110 then
		nAdditon = 10
	elseif nXinfaLevel>=90 and nXinfaLevel<100 then
		nAdditon = 9
	elseif nXinfaLevel>=80 and nXinfaLevel<90 then
		nAdditon = 8
	elseif nXinfaLevel>=70 and nXinfaLevel<80 then
		nAdditon = 7
	elseif nXinfaLevel>=60 and nXinfaLevel<70 then
		nAdditon = 6
	elseif nXinfaLevel>=50 and nXinfaLevel<60 then
		nAdditon = 5
	elseif nXinfaLevel>=40 and nXinfaLevel<50 then
		nAdditon = 4
	elseif nXinfaLevel>=30 and nXinfaLevel<40 then
		nAdditon = 4
	elseif nXinfaLevel>=20 and nXinfaLevel<30 then
		nAdditon = 3
	elseif nXinfaLevel>=10 and nXinfaLevel<20 then
		nAdditon = 2
	elseif nXinfaLevel<10 then
		nAdditon = 1
	end
	return nAdditon
end