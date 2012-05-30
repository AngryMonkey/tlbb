-- 2007ʥ��Ԫ���....
-- Ԫ������ʱ����....
-- ������[ QUFEI 2007-12-06 10:13 UPDATE BugID 27816 ]

-- ����ű�....


-- �ű���
x050029_g_ScriptId = 050029

--ϲ���콵����ű���
x050029_g_EventScriptId = 050028

--��Ŀ����....
x050029_g_NumQuestion	= 20

--��Ŀ������еķ���....
x050029_g_QuestionType = 4

--UICOMMAND
x050029_g_UICommand = 271261215

x050029_g_UIStart			= 1	--��ʼ�������....
x050029_g_UIQuestion	= 2	--��ʾ��Ŀ����....
x050029_g_UIWrong			= 3	--������....
x050029_g_UIEnd				= 4	--����������Ŀ����....

x050029_g_Name     = "Ǯ��"
x050029_g_LowLevel = 10

x050029_g_StartDayTime						= 2008082010		-- ���ʼʱ��
x050029_g_EndDayTime							= 2008082709		-- �����ʱ��

--**********************************
--���ͻ�����ʾ�������
--**********************************
function x050029_ShowQuizUI( sceneId, selfId, targetId )

	--��ȫ���....
	if x050029_AnswerTest( sceneId, selfId ) == 0 then
		return 0
	end

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x050029_g_UIStart)
		UICommand_AddString(sceneId,"#{YUANDAN_DATIINFO_009}")
		UICommand_AddString(sceneId,"#{YUANDAN_DATIINFO_005}")
		UICommand_AddInt(sceneId,targetId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x050029_g_UICommand)

end

--**********************************
--����
--**********************************
function x050029_AskQuestion( sceneId, selfId, Question_Sequence)

	--��ȫ���....
	if x050029_AnswerTest( sceneId, selfId ) == 0 then
		return 0
	end

	--����������ʱ�Ľ���....
	if Question_Sequence > x050029_g_NumQuestion then
		CallScriptFunction( x050029_g_EventScriptId, "OnPlayerQuizFinish", sceneId, selfId )
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050029_g_UIEnd)
			UICommand_AddString(sceneId,"#{YUANDAN_DATIINFO_006}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x050029_g_UICommand)
		return
	end

	--�����һ�����....
	local wenti = GetRandomQuestionsIndex( x050029_g_QuestionType )

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5,sztype=GetQuestionsRecord(wenti)
	if con=="" then
		Msg2Player( sceneId,selfId,"#{YUANDAN_DATIINFO_010}",MSG2PLAYER_PARA)
	end

	local key_position = {}
	--������λ�������
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
		UICommand_AddInt(sceneId,x050029_g_UIQuestion)
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
	DispatchUICommand(sceneId,selfId, x050029_g_UICommand)
	
end

--**********************************
--�ش�
--**********************************
function x050029_AnswerQuestion( sceneId, selfId, Question, Answer1, Question_Sequence)

	--��ȫ���....
	if x050029_AnswerTest( sceneId, selfId ) == 0 then
		return 0
	end
		
	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5=GetQuestionsRecord(Question)

	local Answer_List={}
	Answer_List[0] = key0;
	Answer_List[1] = key1;
	Answer_List[2] = key2;
	Answer_List[3] = key3;
	Answer_List[4] = key4;
	Answer_List[5] = key5;

	if con=="" then
		Msg2Player( sceneId,selfId,"#{YUANDAN_DATIINFO_010}",MSG2PLAYER_PARA)
	end

	local asktime = GetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME)
	if Answer_List[Answer1-1] == 1 and LuaFnGetCurrentTime() - asktime < 305 then

		--�����������....
		x050029_AskQuestion( sceneId, selfId, Question_Sequence + 1)		
		if Question_Sequence < 20 then
			if Question_Sequence > 10 then
				Question_Sequence = Question_Sequence - 10
			end
			CallScriptFunction( x050029_g_EventScriptId, "OnPlayerQuizExp", sceneId, selfId, Question_Sequence )
		end
	else

		--�����������....
		BeginEvent( sceneId )
			AddText( sceneId, "#{YUANDAN_DATIINFO_011}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050029_g_UIWrong)
			UICommand_AddString(sceneId,"#{YUANDAN_DATIINFO_012}")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, x050029_g_UICommand)

		SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP, 0 )
	end

end

--**********************************
--���ⳬʱ
--**********************************
function x050029_OnOverTime( sceneId, selfId )

	--��ȫ���....
	if x050029_AnswerTest( sceneId, selfId ) == 0 then
		return 0
	end

	BeginEvent( sceneId )
		AddText( sceneId, "#{YUANDAN_DATIINFO_011}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x050029_g_UIWrong)
			UICommand_AddString(sceneId,"#{YUANDAN_DATIINFO_012}")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, x050029_g_UICommand)

	SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP, 0 )
end

--**********************************
-- �����������
--**********************************
function x050029_AnswerTest( sceneId, selfId )
		
	if GetLevel( sceneId, selfId ) < x050029_g_LowLevel then		
		return 0
	end
	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local curDayTime = nYear*10000+(nMonth+1)*100+nDay
	local DayTime = GetMissionData( sceneId, selfId, MD_DAOJISHIDATI_YUANDAN_DAYTIME )				-- ����ϴβμӻ��ʱ��
	
	if curDayTime == DayTime then		
		return 0
	end
	
end

--**********************************
--���ʱ��
--**********************************
function x050029_CheckHuoDongTime()

	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local nHour	 = GetHour()
  local curDayTime = nYear*1000000+(nMonth+1)*10000+nDay*100+nHour

        
  if curDayTime >= x050029_g_StartDayTime and curDayTime <= x050029_g_EndDayTime then
  	return 1
	else
		return 0
	end

end
