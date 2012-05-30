--脚本号
x808231_g_scriptId = 808231

x808231_PoTian =250

function x808231_OnImpactFadeOut( sceneId, selfId, impactId )
	if GetHp( sceneId, selfId ) == 0 then
		return
	end	
	local x,z = GetWorldPos( sceneId, selfId )
	local nX=random(0.5,5.1)
	local nR=random(sqrt(nX*nX),5.1)
	local nZ = sqrt(nR*nR-nX*nX)
	--BeginEvent( sceneId )
	--	AddText( sceneId,  )
	--EndEvent( sceneId )
	--DispatchMissionTips( sceneId, selfId )	
	local type=random(1,4)
	if type== 1 then
		x=x+nX
		z=z+nZ
	elseif type==2 then
		x=x+nX
		z=z-nZ
	elseif type==3 then
		x=x-nX
		z=z-nZ
	elseif type==4 then
		x=x-nX
		z=z+nZ
	end
	CreateSpecialObjByDataIndex(sceneId, selfId, x808231_PoTian+x808231_XinFaAddition( sceneId, selfId ), x, z, 0)
end

--**********************************
-- 心法加成
--**********************************
function x808231_XinFaAddition( sceneId, selfId )
	local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, 70)
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