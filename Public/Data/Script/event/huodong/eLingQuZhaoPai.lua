--------------------------------------------
--��һ��ȡ���ƻ�ű�
--Created By �ŵ·�
--------------------------------------------

--�ű���
x808090_g_ScriptId = 808090

--�������ҵȼ�����
x808090_g_LowerLimitLevel = 30

--���ͻ֪ͨ�ʼ�ʱ����
x808090_g_MailStartDayTime = 8121		--�����ʼ���ʼʱ�� 2008-05-01
x808090_g_MailEndDayTime = 8127			--�����ʼ�����ʱ�� 2008-05-07

--����ID��
x808090_g_ZhaoPaiIDT = {
													{30008021,	"���ƣ��޺��"},
													{30008022,	"���ƣ���������"},
													{30008023,	"���ƣ�����ͭ��"},
													{30008024,	"���ƣ���������"},
													{30008025,	"���ƣ���������"}
												}

--�ɹ���ȡ��������
x808090_g_ZhaoPaiType = 5												

--ÿ����ȡ���Ƶ�����
x808090_g_ZhaoPaiCount = 1

--��ȡ����ʱ��Ч��ID(��Ч��������Ч)
x808090_g_GetZhaoPaiImpactID = 49


--**********************************
--������ں���
--**********************************
function x808090_OnDefaultEvent( sceneId, selfId, targetId )
	local ItemID = GetNumText()
	if(ItemID == 10) then	--���һ������̯
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_INTRO}")
			AddNumText( sceneId, x808090_g_ScriptId, "��ȡ����", 6, 12 )
			AddNumText( sceneId, x808090_g_ScriptId, "ȡ��", 6, 13 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	elseif(ItemID == 11) then	--����
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_HELP}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif(ItemID == 12) then
		--��������
		x808090_GeiZhaoPai(sceneId, selfId, targetId)
	elseif(ItemID == 13) then	--"��������"
		--�رս���
		DispatchUICommand(sceneId, selfId, 1000)
	end	
end

--**********************************
--�о��¼�
--**********************************
function x808090_OnEnumerate( sceneId, selfId, targetId )
	if x808090_CheckRightTime() == 1 then	--��ȷ�Ļʱ��
		AddNumText(sceneId, x808090_g_ScriptId, "���һ������̯", 6, 10 )
		AddNumText(sceneId, x808090_g_ScriptId, "���һ������̯�����", 11, 11 )
	end
end

--**********************************
--��⵱ǰ�Ƿ��ǻʱ��
--**********************************
function x808090_CheckRightTime()
	if GetDayTime() >= x808090_g_MailStartDayTime then
		return 1
	else
		return 0
	end
end

--**********************************
--��������
--**********************************
function x808090_GeiZhaoPai(sceneId, selfId, targetId)	
	--���ȼ��Ƿ�ﵽҪ��
	if GetLevel( sceneId, selfId ) < x808090_g_LowerLimitLevel then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_LOWERLIMITLEVEL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
		return
	end
	
	--��⵱���Ƿ���ȡ��"����":ÿ��ֻ����1��.	
	local LastDayValue = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE)--�ϴ���ȡ������ֵ(����Ϊ��λ)
	local CurDayValue = GetDayTime()--��ǰʱ��ֵ(����Ϊ��λ)
	if(CurDayValue <= LastDayValue) then	--���һ����
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_ONCEPERDAY}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end	
	
	--��ⱳ���Ƿ��еط�
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x808090_g_ZhaoPaiCount) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )--������ʾ"�ռ䲻��"

		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULLTIP}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )	--��Ŀ��ʾ"�ռ䲻��"
		return
	end	
	
	--����ͨ��	
	--��¼��ȡ��ʱ��,��֤һ��һ��
	SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE, CurDayValue)
	
	--�������һ��"����"
	local randValue = random(x808090_g_ZhaoPaiType)							--�漴ֵ
	local randZhaoPaiID = x808090_g_ZhaoPaiIDT[randValue][1]		--�漴��ȡ������ID
	local randZhaoPaiName = x808090_g_ZhaoPaiIDT[randValue][2]	--�����ȡ����������
	
	BeginAddItem(sceneId)
		AddItem(sceneId, randZhaoPaiID, x808090_g_ZhaoPaiCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--����Ʒ�����
	
	--��һ��������������Ч
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808090_g_GetZhaoPaiImpactID, 0 )
	
	--������,�½���:�������°�:)
	local str = format("    ���#G%s#W�����°ɣ��ڰ�̯��ʱ��ʹ�ã��������벻����Ч���ޣ�", randZhaoPaiName)
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
	--��Ŀ��ʾ
	str = format("����һ��%s��", randZhaoPaiName)	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	--��������Լ�
	BroadMsgByChatPipe( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--ͳ��"����"��ȡ�˴�
	AuditGeiZhaoPai(sceneId, selfId, tostring(randZhaoPaiName))
end

--**********************************
--������ҷ��ʼ�
--**********************************
function x808090_OnPlayerLogin( sceneId, selfId )
	local curDayTime = GetDayTime()	
	if curDayTime >= x808090_g_MailStartDayTime and curDayTime <= x808090_g_MailEndDayTime then	--�ڷ��ʼ�ʱ��
	
		local HaveMail = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL)	--��ȡ��¼ֵ
		if(HaveMail == 0)then		--��֤�������һ�ڼ��½��ֻ���յ�һ���ʼ�
			LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LQZP_HUODONGMAIL}" )
			SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL, 1)	--��¼�յ����ʼ���
		end
	end	
end
