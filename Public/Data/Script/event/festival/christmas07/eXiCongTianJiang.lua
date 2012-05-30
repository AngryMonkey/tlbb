--2007ʥ��Ԫ���....
--���ֳ齱_ϲ���콵�....

--�������� �һ���ȯ�ű�....


--�ű���
x050022_g_ScriptId = 050022

--�ʱ��
x050022_g_StartDayTime = 2008080610		--���ʼʱ�� 2007-12-24
x050022_g_EndDayTime =2008081309			--�����ʱ�� 2008-1-7

--����ű��ű���
x050022_g_QuizScriptId = 050021

--**********************************
--������ں���
--**********************************
function x050022_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local NumText = GetNumText()

	if NumText == 801 then

		--��ʾ���ִ������....
		x050022_ShowQuiz( sceneId, selfId, targetId )

	elseif NumText == 802 then

		BeginEvent( sceneId )
			AddText( sceneId, "  ��ȷ������ʹ�ý�ȯ���жҽ���" )
			AddNumText(sceneId,x050022_g_ScriptId,"ȷ��",8,803)
			AddNumText(sceneId,x050022_g_ScriptId,"ȡ��",8,804)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif NumText == 811 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 812 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 803 then

		--�һ���ȯ....
		local ret = x050022_GiveGift( sceneId, selfId, targetId )
		if ret == 1 then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		end

	elseif NumText == 804 then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	end

end

--**********************************
--�о��¼�
--**********************************
function x050022_OnEnumerate( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	if LuaFnGetName( sceneId, targetId ) == "����ʦ" then
		AddNumText(sceneId,x050022_g_ScriptId,"ϲ���콵",6,801)
		AddNumText(sceneId,x050022_g_ScriptId,"ϲ���콵����",11,811)
	elseif LuaFnGetName( sceneId, targetId ) == "������" then
		AddNumText(sceneId,x050022_g_ScriptId,"��ȡϲ���콵�����",6,802)
		AddNumText(sceneId,x050022_g_ScriptId,"����ϲ���콵�齱�",8,812)
	end

end

--**********************************
--��ʾϲ���콵�������
--**********************************
function x050022_ShowQuiz( sceneId, selfId, targetId )

	--����Ƿ���Դ���....
	local ret, msg = x050022_CheckCanDoQuiz( sceneId, selfId )
	if 0 == ret then
		x050022_MsgBox( sceneId, selfId, targetId, msg )
		return
	end

	--��ϲ���콵�������....
	CallScriptFunction( x050022_g_QuizScriptId, "ShowQuizUI",sceneId, selfId, targetId )

end

--**********************************
--�����ҵ�ǰ�Ƿ����������
--**********************************
function x050022_CheckCanDoQuiz( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return 0, "  ���ڲ��ǻʱ�䡣"
	end

	local CurLevel = GetLevel( sceneId, selfId )
	local LastLevel = GetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV )

	if CurLevel < 2 then
		return 0, "#{XSCJ_20071205_03}"
	end

	if CurLevel > 25 then
		return 0, "#{XSCJ_20071205_04}"
	end

	if LastLevel >= CurLevel then
		return 0, "#{XSCJ_20071205_05}" 
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		return 0, "#{XSCJ_20071205_06}"
	end

	return 1

end

--**********************************
--��⵱ǰ�Ƿ��ǻʱ��
--**********************************
function x050022_CheckRightTime()
local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local nHour	 = GetHour()
  local curDayTime = nYear*1000000+(nMonth+1)*10000+nDay*100+nHour

	if curDayTime >= x050022_g_StartDayTime and curDayTime <= x050022_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050022_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��Ҵ��������Ŀʱ�ص��˺���
--**********************************
function x050022_OnPlayerFinishQuiz( sceneId, selfId )

	--��¼�����Ѿ���������������....
	local Level = GetLevel( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV, Level )

	--����ȯ....
	TryRecieveItem( sceneId, selfId, 30505147, QUALITY_MUST_BE_CHANGE )

	--��Ŀ��ʾ
	BeginEvent( sceneId )
		AddText( sceneId, "#{XSCJ_20071205_10}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--��Ч....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

end

--**********************************
--�������ʱ�ص��˺���
--**********************************
function x050022_OnPlayerLevelUp( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		return
	end

	LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "#{XSCJ_20071205_01}")

end

--**********************************
--�һ���ȯ
--**********************************
function x050022_GiveGift( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return 0
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_12}" )
		return 0
	end

	--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_13}" )
		return 0
	end

	--�۽�ȯ....
	if 0 == DelItem(sceneId, selfId, 30505147, 1) then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_14}" )
		return 0
	end

	--����Ʒ....
	local GiftTbl = {

		--��Ҫǿ�ư󶨵���Ʒ....
		{ itemId=30505146, odds=200 },
		{ itemId=30505171, odds=200 },
		{ itemId=30505170, odds=200 },

		--��Ҫ�������Ʒ....
		{ itemId=10141096, odds=50 },
		{ itemId=10141097, odds=50 },
		{ itemId=10141098, odds=40 },
		{ itemId=10141099, odds=40 },
		{ itemId=30501128, odds=110 },
		{ itemId=30501129, odds=110 },

	}
	
	local index = 0
	local randValue = random(1000);
	randValue = randValue - 1;

	for i, item in GiftTbl do
		if item.odds >= randValue then
			index = i
			break;
		end
		randValue = randValue - item.odds;
	end

	if index == 0 then
		return 0
	end

	if index < 4 then

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			BeginEvent( sceneId )
				AddText( sceneId, "ϲ���콵����ϲ�����#{_ITEM"..GiftTbl[index].itemId.."}������ϣ�����ٽ�����" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			LuaFnItemBind( sceneId, selfId, BagIndex)
		end

	else

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then

			BeginEvent( sceneId )
				AddText( sceneId, "ϲ���콵����ϲ�����#{_ITEM"..GiftTbl[index].itemId.."}������ϣ�����ٽ�����" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )

			local strTrans = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local strName = GetName(sceneId, selfId)
			local strMsg = format("#P��������������������ϲ���콵����ϲ#{_INFOUSR%s}���#{_INFOMSG%s}һ����ϣ��#{_INFOUSR%s}�ٽ�������", strName, strTrans, strName)

			MonsterTalk(sceneId, targetId, "����", strMsg)

		end

	end

	--��Ч....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

	return 1

end

