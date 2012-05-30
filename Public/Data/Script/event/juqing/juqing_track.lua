-- 200098  剧情任务跟踪

x200098_g_ScriptId = 200098

x200098_g_Juqing_1={
{MisId=0, DescC="", DescH=""},
{MisId=1, DescC="#{Juqing_Can_001}", DescH="#{Juqing_Have_001}"},
{MisId=2, DescC="#{Juqing_Can_002}", DescH="#{Juqing_Have_002}"},
{MisId=3, DescC="#{Juqing_Can_003}", DescH="#{Juqing_Have_003}"},
{MisId=4, DescC="#{Juqing_Can_004}", DescH="#{Juqing_Have_004}"},
{MisId=5, DescC="#{Juqing_Can_005}", DescH="#{Juqing_Have_005}"},
{MisId=6, DescC="#{Juqing_Can_006}", DescH="#{Juqing_Have_006}"},
{MisId=7, DescC="#{Juqing_Can_007}", DescH="#{Juqing_Have_007}"},
{MisId=8, DescC="#{Juqing_Can_008}", DescH="#{Juqing_Have_008}"},--}

--x200098_g_Juqing_2={
{MisId=9 , DescC="#{Juqing_Can_009}", DescH="#{Juqing_Have_009}"},
{MisId=10, DescC="#{Juqing_Can_010}", DescH="#{Juqing_Have_010}"},
{MisId=11, DescC="#{Juqing_Can_011}", DescH="#{Juqing_Have_011}"},
{MisId=12, DescC="#{Juqing_Can_012}", DescH="#{Juqing_Have_012}"},
{MisId=13, DescC="#{Juqing_Can_013}", DescH="#{Juqing_Have_013}"},
{MisId=14, DescC="#{Juqing_Can_014}", DescH="#{Juqing_Have_014}"},
{MisId=15, DescC="#{Juqing_Can_015}", DescH="#{Juqing_Have_015}"},--}

--x200098_g_Juqing_3={
{MisId=16, DescC="#{Juqing_Can_016}", DescH="#{Juqing_Have_016}"},
{MisId=17, DescC="#{Juqing_Can_017}", DescH="#{Juqing_Have_017}"},
{MisId=18, DescC="#{Juqing_Can_018}", DescH="#{Juqing_Have_018}"},
{MisId=19, DescC="#{Juqing_Can_029}", DescH="#{Juqing_Have_029}"},
{MisId=20, DescC="#{Juqing_Can_020}", DescH="#{Juqing_Have_020}"},
{MisId=21, DescC="#{Juqing_Can_021}", DescH="#{Juqing_Have_021}"},
{MisId=47, DescC="#{Juqing_Can_046}", DescH="#{Juqing_Have_046}"},--}
{MisId=22, DescC="#{Juqing_Can_022}", DescH="#{Juqing_Have_022}"},
{MisId=23, DescC="#{Juqing_Can_023}", DescH="#{Juqing_Have_023}"},

--x200098_g_Juqing_4={
{MisId=24, DescC="#{Juqing_Can_024}", DescH="#{Juqing_Have_024}"},
{MisId=25, DescC="#{Juqing_Can_025}", DescH="#{Juqing_Have_025}"},
{MisId=26, DescC="#{Juqing_Can_026}", DescH="#{Juqing_Have_026}"},
{MisId=27, DescC="#{Juqing_Can_027}", DescH="#{Juqing_Have_027}"},
{MisId=28, DescC="#{Juqing_Can_028}", DescH="#{Juqing_Have_028}"},
{MisId=29, DescC="#{Juqing_Can_029}", DescH="#{Juqing_Have_029}"},
{MisId=30, DescC="#{Juqing_Can_030}", DescH="#{Juqing_Have_030}"},
{MisId=31, DescC="#{Juqing_Can_031}", DescH="#{Juqing_Have_031}"},
{MisId=32, DescC="#{Juqing_Can_032}", DescH="#{Juqing_Have_032}"},--}

--x200098_g_Juqing_5={
{MisId=33, DescC="#{Juqing_Can_033}", DescH="#{Juqing_Have_033}"},
{MisId=34, DescC="#{Juqing_Can_034}", DescH="#{Juqing_Have_034}"},
{MisId=35, DescC="#{Juqing_Can_035}", DescH="#{Juqing_Have_035}"},
{MisId=36, DescC="#{Juqing_Can_036}", DescH="#{Juqing_Have_036}"},
{MisId=37, DescC="#{Juqing_Can_037}", DescH="#{Juqing_Have_037}"},--}

--x200098_g_Juqing_6={
{MisId=38, DescC="#{Juqing_Can_038}", DescH="#{Juqing_Have_038}"},
{MisId=39, DescC="#{Juqing_Can_039}", DescH="#{Juqing_Have_039}"},
{MisId=40, DescC="#{Juqing_Can_040}", DescH="#{Juqing_Have_040}"},
{MisId=41, DescC="#{Juqing_Can_041}", DescH="#{Juqing_Have_041}"},
{MisId=42, DescC="#{Juqing_Can_042}", DescH="#{Juqing_Have_042}"},
{MisId=43, DescC="#{Juqing_Can_043}", DescH="#{Juqing_Have_043}"},
{MisId=44, DescC="#{Juqing_Can_044}", DescH="#{Juqing_Have_044}"},
{MisId=45, DescC="#{Juqing_Can_045}", DescH="#{Juqing_Have_045}"},}

function x200098_DispatchJuqintInfo(sceneId, selfId, targetId)
	
	-- 获得玩家的等级
	local nLevel = LuaFnGetLevel(sceneId, selfId)
	local DoneMis = 1
	local HaveMis = 1
	local CanMis = 1
	
	if nLevel < 20 then
		BeginEvent(sceneId)	
			AddText( sceneId, "  你现在的等级还不到20，不能启动剧情任务，请到20级后再来找我。" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
		
	else
		-- 1,检测玩家做过哪些能做的任务
		for i=2, 47   do
			if IsMissionHaveDone(sceneId,selfId,x200098_g_Juqing_1[i].MisId) < 1 then
				DoneMis = i-1 --x200098_g_Juqing_1[i].MisId - 1
				break
			end
		end

		-- 2,检测玩家做过哪些能做的任务
		for i=2, 47   do
			if IsHaveMission(sceneId,selfId,x200098_g_Juqing_1[i].MisId) > 0 then
				HaveMis = i --x200098_g_Juqing_1[i].MisId
				break
			end
		end
		
		-- 3,检测玩家现在可以接的任务
		if HaveMis == 1  then
			CanMis = DoneMis + 1
		end
		
		if DoneMis<1 then
			DoneMis=1
		end
		if HaveMis<1 then
			HaveMis=1
		end
		if CanMis<1 then
			CanMis=1
		end
		
	end
	
	local szText = ""
	
	if HaveMis == 1    then
		szText = x200098_g_Juqing_1[CanMis].DescC
	else
		szText = x200098_g_Juqing_1[HaveMis].DescH
	end
	
	-- 玩家完成了所有当前制作完成的剧情任务
	if IsMissionHaveDone(sceneId,selfId,45) > 0 then
		szText = "你现在已经完成了#G万劫谷、燕子坞、聚贤庄、苍茫山、擂鼓山#W和#G一品堂#W剧情任务。"
	end
	
	BeginEvent(sceneId)	
		AddText( sceneId, szText )
--		AddText( sceneId, "DoneMis =" .. DoneMis )
--		AddText( sceneId, "HaveMis =" .. HaveMis )
--		AddText( sceneId, "CanMis =" .. CanMis )
--		AddText( sceneId, "你已经完成的任务是 =" .. x200098_g_Juqing_1[DoneMis].MisId )
--		AddText( sceneId, "你现在接到的任务是 =" .. x200098_g_Juqing_1[HaveMis].MisId )
--		AddText( sceneId, "你现在可以接到的任务是 =" .. x200098_g_Juqing_1[CanMis].MisId )
--	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end
