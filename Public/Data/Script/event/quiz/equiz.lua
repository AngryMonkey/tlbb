x311100_g_ScriptId = 311100

--��������NPC����
x311100_g_Position_X=147.4986
x311100_g_Position_Z=146.2925
x311100_g_SceneID=2
x311100_g_AccomplishNPC_Name="Ǯ��"

x311100_g_MissionName="�������"

-- ����UI 	2

--1.client����NPC��һ���Ի�����
--2.��client����
--3.����client����ˡ�
--4.���ߴ���10���⣬������
x311100_g_Quiz_Hortation = {}
x311100_g_Quiz_Newbie_Hortation = {}

x311100_g_Quiz_Hortation[1] = 36
x311100_g_Quiz_Hortation[2] = 72
x311100_g_Quiz_Hortation[3] = 109
x311100_g_Quiz_Hortation[4] = 145
x311100_g_Quiz_Hortation[5] = 181
x311100_g_Quiz_Hortation[6] = 218
x311100_g_Quiz_Hortation[7] = 254
x311100_g_Quiz_Hortation[8] = 290
x311100_g_Quiz_Hortation[9] = 330
x311100_g_Quiz_Hortation[10] = 365

x311100_g_Quiz_Newbie_Hortation[1] = 4 
x311100_g_Quiz_Newbie_Hortation[2] = 7 
x311100_g_Quiz_Newbie_Hortation[3] = 10
x311100_g_Quiz_Newbie_Hortation[4] = 14
x311100_g_Quiz_Newbie_Hortation[5] = 18
x311100_g_Quiz_Newbie_Hortation[6] = 21
x311100_g_Quiz_Newbie_Hortation[7] = 25
x311100_g_Quiz_Newbie_Hortation[8] = 29
x311100_g_Quiz_Newbie_Hortation[9] = 33
x311100_g_Quiz_Newbie_Hortation[10] = 36

x311100_g_AccomplishCircumstance = 1

--**********************************
function x311100_OnDefaultEvent( sceneId, selfId, targetId )
		local TransportNPCName=GetName(sceneId,targetId);
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,1)
			UICommand_AddString(sceneId,"#gFF0FA0��������")
			UICommand_AddString(sceneId,"#{function_help_084}")
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
		SetMissionData(sceneId,selfId,MD_QUIZ_TARGET,targetId)

		return
end

--**********************************
--�о��¼�
--**********************************
function x311100_OnEnumerate( sceneId, selfId, targetId )
	if	LuaFnGetLevel( sceneId, selfId)>=2 and LuaFnGetLevel( sceneId, selfId)<=20 then
			AddNumText(sceneId,x311100_g_ScriptId,x311100_g_MissionName , 6, -1);
    end
end

--**********************************
--����
--**********************************
function x311100_AskQuestion( sceneId, selfId, Question_Sequence)
	if Question_Sequence == 1 and x311100_OnAccept_Quiz( sceneId, selfId ) <= 0 then
		return
	end
	if Question_Sequence > 5 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
			UICommand_AddString(sceneId,"��ϲ������ȫ�����⣡#r�´α����Ǽ����μ�^_^")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
		if( IsHaveMission(sceneId,selfId,447) > 0)  then			
			local misIndex = GetMissionIndexByID(sceneId,selfId,447)
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
			
			BeginEvent(sceneId)
				strText = "�����������⣬������ɡ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			local targetId=GetMissionData(sceneId,selfId,MD_QUIZ_TARGET)
			CallScriptFunction( 002031, "OnDefaultEvent", sceneId, selfId, targetId )
			return			
		end
		
		
		return
	end

--�����һ������
	
	local wenti = GetRandomQuestionsIndex(1)

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5,sztype=GetQuestionsRecord(wenti)

	if con=="" then		--ע���������ѡ���ǿ�����  ==""   ���ж�
		Msg2Player( sceneId,selfId,"δ�ҵ�����",MSG2PLAYER_PARA)
	end
	
	local key_position = {}
	--������λ�������
	x311100_g_rand = random(0,2)
	if x311100_g_rand == 0 then
		key_position[0] = 1
		key_position[1] = 2
		key_position[2] = 0
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	elseif x311100_g_rand == 1 then
		key_position[0] = 2
		key_position[1] = 0
		key_position[2] = 1
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	else
		key_position[0] = 0
		key_position[1] = 1
		key_position[2] = 2
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	end

	local asktime = LuaFnGetCurrentTime();
	SetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME,asktime)
	
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,2)
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
	DispatchUICommand(sceneId,selfId, 2)
	return

end

--**********************************
--�ش�
--**********************************
function x311100_AnswerQuestion( sceneId, selfId, Question, Answer1,  Question_Sequence)

	local Answer_List={}
	local Player_Level = GetLevel( sceneId, selfId );

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5=GetQuestionsRecord(Question)
	Answer_List[0] = key0;
	Answer_List[1] = key1;
	Answer_List[2] = key2;
	Answer_List[3] = key3;
	Answer_List[4] = key4;
	Answer_List[5] = key5;
	
	if con=="" then		--ע���������ѡ���ǿ�����  ==""   ���ж�
		Msg2Player( sceneId,selfId,"δ�ҵ�����",MSG2PLAYER_PARA)
	end
	
	local asktime = GetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME)
	
	if Answer_List[Answer1-1] == 1 and LuaFnGetCurrentTime() - asktime < 305 then

		--û������Ž�����Ǯ
		if( IsHaveMission(sceneId,selfId,447) <= 0)  then
			--������Ǯ
			if Question_Sequence > 0 and Question_Sequence < 11 then
				if Player_Level > 9 then
					x311100_g_Money = x311100_g_Quiz_Hortation[Question_Sequence]
				else
				 	x311100_g_Money = x311100_g_Quiz_Newbie_Hortation[Question_Sequence]
				end
			else
				--x311100_g_Money = 10 * Question_Sequence
				x311100_g_Money = 1
			end
			--AddMoney(sceneId,selfId,x311100_g_Money)
			--Msg2Player( sceneId,selfId,"��õ�#{_MONEY"..x311100_g_Money.."}",MSG2PLAYER_PARA)
		end
	--�����������
		x311100_AskQuestion( sceneId, selfId, Question_Sequence + 1)
	else
	--�����������
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
			UICommand_AddString(sceneId,"���ϧ����Ĵ��Ǵ���ġ�����ģ��´���Ŭ���ϡ�")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
	end

end

function x311100_OnAccept_Quiz( sceneId, selfId )

	if( IsHaveMission(sceneId,selfId,447) > 0)  then
		return 1
	end
	
	local Max_Time_EveryDay =5
	--begin modified by zhangguoxin 090207
	local iDayCount=GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT)
	local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)	--��һ�ν������ʱ��(����)
	local iDayTime = iTime	--��һ�ν������ʱ��(����)
	--local iQuarterTime = mod(iTime,100)	--��һ�ν������ʱ��(��)
	local iDayHuan = floor(iDayCount/100000) --��������ɵ��������

	--local CurTime = GetHourTime()		--��ǰʱ��
	--local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	local CurDaytime = GetDayTime()	--��ǰʱ��(��)
	--local CurQuarterTime = mod(CurTime,100)	--��ǰʱ��(��)
		
	if CurDaytime==iDayTime then 	--�ϴ����������ͬһ����
		if iDayHuan >= Max_Time_EveryDay then

			BeginEvent(sceneId)
				strText = format("�����ʴ�һ�������%d�Σ����Ѿ�����%d�Ρ�", Max_Time_EveryDay,iDayHuan )	
				AddText(sceneId,strText)
 			EndEvent(sceneId)
 			DispatchMissionTips(sceneId,selfId)
 			
			return -1
		end
		iDayHuan = iDayHuan+1
	else							--�ϴ����������ͬһ�죬����
		iDayTime = CurDaytime
		iDayHuan = 1
	end
	
	--iDayCount = iDayHuan*100000+CurDaytime*100+CurQuarterTime 
	iDayCount = iDayHuan*100000 + CurDaytime;
		
	SetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT,iDayCount)
	--begin modified by zhangguoxin 090207
	return 1
	
end

function x311100_OnOverTime( sceneId, selfId )
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
			UICommand_AddString(sceneId,"���ϧ����Ĵ��Ǵ���ġ�����ģ��´���Ŭ���ϡ�")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2)
end
