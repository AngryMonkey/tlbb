--新圣火传递....
--答题....

--脚本号
x808093_g_ScriptId = 808093


--题目数量....
x808093_g_NumQuestion	= 5

--题目在题库中的分类....
x808093_g_QuestionType = 9

--新圣火传递答题任务号....
x808093_g_MissionIndexA = 1004
x808093_g_MissionIndexB = 1008

--新圣火传递领取答题任务NPC....
x808093_g_MisNPCNameA = "申情"
x808093_g_MisNPCNameB = "燕青"

--UICOMMAND
x808093_g_UICommand = 20080419

x808093_g_UIStart			= 1	--开始答题界面....
x808093_g_UIQuestion	= 2	--显示题目界面....
x808093_g_UIWrong			= 3	--答错界面....
x808093_g_UIEnd				= 4	--答完所有题目界面....

--**********************************
--任务入口函数
--**********************************
function x808093_OnDefaultEvent( sceneId, selfId, targetId )

	local NumText = GetNumText()
	if NumText ~= 1 and NumText ~= 2 then
		return
	end

	local npcName = LuaFnGetName( sceneId, targetId )
	if x808093_g_MisNPCNameA ~= npcName and x808093_g_MisNPCNameB ~= npcName then
		return
	end

	if IsHaveMission( sceneId, selfId, x808093_g_MissionIndexA ) == 0 and
			IsHaveMission( sceneId, selfId, x808093_g_MissionIndexB ) == 0 then
		return
	end

	--显示答题界面....
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x808093_g_UIStart)
		UICommand_AddString(sceneId,"#gFF0FA0体育知识问答")
		UICommand_AddString(sceneId,"#{XSHCD_20080418_060}")
		UICommand_AddInt(sceneId,targetId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x808093_g_UICommand)

end

--**********************************
--列举事件
--**********************************
function x808093_OnEnumerate( sceneId, selfId, targetId )

	local npcName = LuaFnGetName( sceneId, targetId )

	if x808093_g_MisNPCNameA == npcName then

		if IsHaveMission( sceneId, selfId, x808093_g_MissionIndexA ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x808093_g_MissionIndexA )
			if 0 == GetMissionParam( sceneId, selfId, misIndex, 0 ) then
				AddNumText( sceneId, x808093_g_ScriptId, "体育知识问答", 6, 1 )
			end
		end

	elseif x808093_g_MisNPCNameB == npcName then

		if IsHaveMission( sceneId, selfId, x808093_g_MissionIndexB ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x808093_g_MissionIndexB )
			if 0 == GetMissionParam( sceneId, selfId, misIndex, 0 ) then
				AddNumText( sceneId, x808093_g_ScriptId, "体育知识问答", 6, 2 )
			end
		end

	end

end

--**********************************
--提问
--**********************************
function x808093_AskQuestion( sceneId, selfId, Question_Sequence)

	--打完了所有题就显示答完的界面....
	if Question_Sequence > x808093_g_NumQuestion then

		x808093_OnPlayerFinishQuiz( sceneId, selfId )

		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x808093_g_UIEnd)
			UICommand_AddString(sceneId,"#{XSHCD_20080418_063}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x808093_g_UICommand)
		return

	end

	--随机出一个题号....
	local wenti = GetRandomQuestionsIndex( x808093_g_QuestionType )

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5,sztype=GetQuestionsRecord(wenti)
	if con=="" then
		Msg2Player( sceneId,selfId,"未找到问题",MSG2PLAYER_PARA)
	end

	local key_position = {}
	--把他们位置随机掉
	local rand = random(3)
	if rand == 1 then
		key_position[0] = 1
		key_position[1] = 2
		key_position[2] = 0
	elseif rand == 2 then
		key_position[0] = 2
		key_position[1] = 0
		key_position[2] = 1
	else
		key_position[0] = 0
		key_position[1] = 1
		key_position[2] = 2
	end
	key_position[3] = -1
	key_position[4] = -1
	key_position[5] = -1

	local asktime = LuaFnGetCurrentTime();
	SetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME,asktime)

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x808093_g_UIQuestion)
		UICommand_AddInt(sceneId,Question_Sequence)
		UICommand_AddInt(sceneId,wenti)		
		UICommand_AddString(sceneId,con)
		UICommand_AddString(sceneId,opt0)
		UICommand_AddString(sceneId,opt1)
		UICommand_AddString(sceneId,opt2)
		UICommand_AddString(sceneId,opt3)
		UICommand_AddString(sceneId,opt4)
		UICommand_AddString(sceneId,opt5)
		UICommand_AddInt(sceneId,key_position[0])
		UICommand_AddInt(sceneId,key_position[1])
		UICommand_AddInt(sceneId,key_position[2])
		UICommand_AddInt(sceneId,key_position[3])
		UICommand_AddInt(sceneId,key_position[4])
		UICommand_AddInt(sceneId,key_position[5])
		UICommand_AddInt(sceneId,-1 )
		UICommand_AddString(sceneId,sztype)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x808093_g_UICommand)

end

--**********************************
--回答
--**********************************
function x808093_AnswerQuestion( sceneId, selfId, Question, Answer1, Question_Sequence)

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5=GetQuestionsRecord(Question)

	local Answer_List={}
	Answer_List[0] = key0;
	Answer_List[1] = key1;
	Answer_List[2] = key2;
	Answer_List[3] = key3;
	Answer_List[4] = key4;
	Answer_List[5] = key5;

	if con=="" then
		Msg2Player( sceneId,selfId,"未找到问题",MSG2PLAYER_PARA)
	end

	local asktime = GetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME)
	if Answer_List[Answer1-1] == 1 and LuaFnGetCurrentTime() - asktime < 305 then

		x808093_AskQuestion( sceneId, selfId, Question_Sequence + 1)

	else

		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x808093_g_UIWrong)
			UICommand_AddString(sceneId,"#{XSHCD_20080418_061}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x808093_g_UICommand)

	end

end

--**********************************
--答题超时
--**********************************
function x808093_OnOverTime( sceneId, selfId )

	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x808093_g_UIWrong)
			UICommand_AddString(sceneId,"#{XSHCD_20080418_062}")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x808093_g_UICommand)

end

--**********************************
--玩家答完所有题目
--**********************************
function x808093_OnPlayerFinishQuiz( sceneId, selfId )

	--如果有未完成的新圣火传递的答题任务....则将任务置为完成....

	if IsHaveMission( sceneId, selfId, x808093_g_MissionIndexA ) > 0 then

		local misIndex = GetMissionIndexByID( sceneId, selfId, x808093_g_MissionIndexA )
		if 0 == GetMissionParam( sceneId, selfId, misIndex, 0 ) then
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, 1, 1 )
		end

	elseif IsHaveMission( sceneId, selfId, x808093_g_MissionIndexB ) > 0 then

		local misIndex = GetMissionIndexByID( sceneId, selfId, x808093_g_MissionIndexB )
		if 0 == GetMissionParam( sceneId, selfId, misIndex, 0 ) then
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, 1, 1 )
		end

	end

end
