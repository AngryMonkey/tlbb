--ѭ������
--Ѱ�ұ���
--����ǿ�Ĳ���:	Ѱ����ʽ����ǿ,1���е�ֱ�Ӹ�����Ҿ���2����̽����ʹ��
--				����3ʹ��̽����������������ʾ����4ʹ��̽�������÷�����
--				��ʾ5ʹ��̽����������ҵ�ǰ����������ʾ6�ҵ���һ��λ��
--				��ָʾ����λ�õ�ֽ��7�ҵ���һ��λ�û�Ҫ���������֪��
--				����λ��

--************************************************************************
--MisDescBegin
--�ű���
x500500_g_ScriptId = 500500

--��һ�������ID
--g_MissionIdPre =

--�����
x500500_g_MissionId = 700

--����Ŀ��npc
x500500_g_Name	="��ִ��" 

--������߱��
x500500_g_ItemId = 40002106

--���������������
x500500_g_ItemNeedNum = 1

--�������
x500500_g_MissionKind = 1

--����ȼ�
x500500_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x500500_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
x500500_g_IsMissionOkFail = 0					--�����ĵ�0λ
x500500_g_DemandItem={{id=40002106,num=1}}		--������1λ,������Ҫ�õ�����Ʒ
x500500_g_MissionRound = 3						--ѭ�����������������������������Ļ��� MD_WABAO_HUAN
--**********************************�����Ƕ�̬****************************


--�����ı�����
x500500_g_MissionName="Ѱ��"
x500500_g_MissionInfo="#{M_700_TEXT1}"  --��������
x500500_g_MissionTarget="�ҵ����ؽ�����ִ��"		--����Ŀ��
x500500_g_ContinueInfo="���ҵ�������ô�������������е�̽�����Ϳ����ҵ����ص�λ����"		--δ��������npc�Ի�
x500500_g_MissionComplete="�ɵĲ���"					--�������npc˵���Ļ�

x500500_g_MoneyBonus=100
x500500_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
--0�ţ�����״̬
--1�ţ�������Ҫ����Ʒ(�������ֻ��һ��)
--2�ţ��������ڳ������
--3�ţ�����x����
--4�ţ�����z����
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��

--����λ��
x500500_g_TreasureAddress = {	{scene=0,x=105,z=88},
						{scene=0,x=146,z=60},
						{scene=0,x=99,z=114},
						{scene=0,x=80,z=85},
						{scene=0,x=55,z=134},
						{scene=0,x=203,z=45},
						{scene=0,x=24,z=67},
						{scene=0,x=219,z=109},
						{scene=0,x=222,z=62},
						{scene=0,x=227,z=196},
						{scene=0,x=168,z=224},
						{scene=0,x=88,z=226},
						{scene=0,x=34,z=111}}


--**********************************
--������ں���
--**********************************
function x500500_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if IsHaveMission(sceneId,selfId,x500500_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x500500_g_MissionName)
			AddText(sceneId,x500500_g_ContinueInfo)
			AddText(sceneId," ")
			AddText(sceneId,"��Ҫ��Ʒ��")
			for i, item in x500500_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x500500_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId,bDone)
	--���������������
	elseif x500500_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x500500_g_MissionName)
			AddText(sceneId,x500500_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x500500_g_MissionTarget)
			AddMoneyBonus( sceneId, x500500_g_MoneyBonus )
			AddText(sceneId,"#{M700_6}")
			for i, item in x500500_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x500500_OnEnumerate( sceneId, selfId, targetId )
    --����ѽӴ�����
    --else

    if IsHaveMission(sceneId,selfId,x500500_g_MissionId) > 0 then
		AddNumText(sceneId,x500500_g_ScriptId,x500500_g_MissionName,3,-1);
    --���������������
    elseif x500500_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x500500_g_ScriptId,x500500_g_MissionName,4,-1);
    end
end

--**********************************
--����������
--**********************************
function x500500_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x500500_OnAccept( sceneId, selfId )

	if x500500_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
	x500500_g_sequence = random(13)					--���ݱ���ص��������һ�������
	SceneNum = x500500_g_TreasureAddress[x500500_g_sequence].scene
	X		 = x500500_g_TreasureAddress[x500500_g_sequence].x
	Z		 = x500500_g_TreasureAddress[x500500_g_sequence].z
	--��ӱ���̽����
	BeginAddItem(sceneId)
		ret = AddItem( sceneId,40002104, 1 )
	EndAddItem(sceneId,selfId)
	--������������б�
	ret = AddMission( sceneId,selfId, x500500_g_MissionId, x500500_g_ScriptId, 0, 0, 1 )

	--���������������ĳ�����ź�����λ��
	misIndex = GetMissionIndexByID(sceneId,selfId,x500500_g_MissionId)		--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����
	SetMissionByIndex(sceneId,selfId,misIndex,1,x500500_g_DemandItem[1].id)						--�������кŰ���������ĵ�2λ��Ϊ������Ʒ�ı��
	SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)			--�ѵ���λ��Ϊ����ĳ������
	SetMissionByIndex(sceneId,selfId,misIndex,3,X)					--�ѵ���λ��Ϊ�����X����
	SetMissionByIndex(sceneId,selfId,misIndex,4,Z)					--�ѵ���λ��Ϊ�����Z����
	
	AddItemListToHuman(sceneId,selfId)

	--�õ�����
	local huan = GetMissionData(sceneId,selfId,x500500_g_MissionRound)
	--��������1
	huan = huan + 1
	SetMissionData(sceneId,selfId,x500500_g_MissionRound,huan)
	Msg2Player( sceneId,selfId,"��������Ѱ��",MSG2PLAYER_PARA)
	Msg2Player( sceneId,selfId,"��ǰ��"..huan.."��",MSG2PLAYER_PARA)	

end

--**********************************
--����
--**********************************
function x500500_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x500500_g_MissionId )
	DelItem (sceneId,selfId,40002104,1)
	SetMissionData(sceneId,selfId,12,0)	--������0
end

--**********************************
--����
--**********************************
function x500500_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x500500_g_MissionName)
		AddText(sceneId,x500500_g_MissionComplete)
		AddMoneyBonus( sceneId, x500500_g_MoneyBonus )
		for i, item in x500500_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x500500_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x500500_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	for i, item in x500500_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x500500_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local huan = GetMissionData(sceneId,selfId,x500500_g_MissionRound)

	--���㽱����Ǯ������
	if mod(huan,10) == 0 then
		x500500_g_Money = 1000 * 15
	else
		x500500_g_Money = 1000 * mod(huan,10)
	end
	
	if x500500_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x500500_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			--for i, item in g_RadioItemBonus do
			--	if item.id == selectRadioId then
			--		AddItem( sceneId,item.id, item.num )
			--	end
			--end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			
			ret = DelMission( sceneId, selfId, x500500_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x500500_g_MissionId )
				local bDelItem = true
				--�۳�������Ʒ
				for i, item in x500500_g_DemandItem do
					if 0== DelItem( sceneId, selfId, item.id, item.num ) then
						bDelItem = bDelItem and false
					end
				end
				--ɾ��̽����
				if 0==DelItem( sceneId, selfId, 40002104, 1 ) then
					bDelItem = bDelItem and false
				end
				if(true==bDelItem) then
					AddItemListToHuman(sceneId,selfId)
					--��Ǯ����
					AddMoney(sceneId,selfId,x500500_g_Money )
					--������ֵ����
					AddExp( sceneId,selfId,x500500_g_Money)	
	
					Msg2Player( sceneId,selfId,"��õ�"..x500500_g_Money.."���",MSG2PLAYER_PARA)
				end
			end
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end      
	end
end

--**********************************
--ɱ����������
--**********************************
function x500500_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x500500_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x500500_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x500500_g_ItemId then
		x500500_g_ItemNum = GetItemCount(sceneId,selfId,x500500_g_ItemId)
		if x500500_g_ItemNum < x500500_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x500500_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = format("�ѵõ�����%d/1", x500500_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--����ʹ��
--**********************************
function x500500_OnUseItem( sceneId, selfId, BagIndex )
	misIndex = GetMissionIndexByID(sceneId,selfId,x500500_g_MissionId)
	x500500_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--�������״̬
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					--��ñ��ﳡ����
	treasureX = GetMissionParam(sceneId,selfId,misIndex,3)				--��ñ���X����
	treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				--��ñ���Z����	
	--��������Ѿ����
	if x500500_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"�Ѿ��ҵ���,��ȥ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--ȡ����ҵ�ǰ����
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--��������뱦�صľ���
	Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId ~= scene then
		BeginEvent(sceneId)
			AddText(sceneId,"�ƺ����ز����������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance >1 then
		BeginEvent(sceneId)
			AddText(sceneId,"���뱦�ػ���"..Distance.."��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 1 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x500500_g_DemandItem[1].id, 1 )
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--������״̬��������Ϊ1,��ʾ�Ѿ����
		else
			BeginEvent(sceneId)
				AddText(sceneId,"��������������")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end
