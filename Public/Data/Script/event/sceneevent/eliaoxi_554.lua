--���� �ؽ�����
--MisDescBegin
--�ű���
x212108_g_ScriptId = 212108

--�����
x212108_g_MissionId = 554

--�������
x212108_g_MissionKind = 32

--����ȼ�
x212108_g_MissionLevel = 78

--�Ƿ��Ǿ�Ӣ����
x212108_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212108_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
--x212108_g_DemandItem={{id=40002112,num=1}}		--������1λ

--�����ı�����
x212108_g_MissionName="�ؽ�����"
x212108_g_MissionInfo="#{Lua_liaoxi_002}"
x212108_g_MissionTarget="  �ҵ�10�麮����ʯ��10����ʯ���Լ�10����ң������ǽ���#G����������#W��#RҮ�ɽ�#W#{_INFOAIM170,206,21,Ү�ɽ�}��"
x212108_g_ContinueInfo="  ���ҵ��㹻�Ĳ�������"
x212108_g_MissionComplete="  лл��İ������������ؽ�����һ���������ʵ����̺���ɿڵĿ���úõ��д��㡣"

x212108_g_DemandItem={{id=20103004,num=10},{id=20103005,num=10}}		--�ӱ����м���

--����
x212108_g_MoneyBonus=46000
x212108_g_Exp = 65000
--x212108_g_ItemBonus={{id=10401031,num=1}}

x212108_g_RadioItemBonus={{id=10405067 ,num=1},{id=10401067,num=1},{id=10400068,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212108_OnDefaultEvent( sceneId, selfId, targetId )
	
	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212108_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212108_g_MissionName);
				AddText(sceneId,x212108_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212108_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId,done)
--		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= 78 then
	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212108_g_MissionName);
			AddText(sceneId,x212108_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212108_g_MissionTarget);
			AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
			for i, item in x212108_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)

	end
end

--**********************************
--�о��¼�
--**********************************
function x212108_OnEnumerate( sceneId, selfId, targetId )

	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		AddNumText(sceneId, x212108_g_ScriptId,x212108_g_MissionName, 2, -1)

	--���������������
	elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212108_g_MissionName then
			AddNumText(sceneId, x212108_g_ScriptId, x212108_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--��ⴥ������
--**********************************
function x212108_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 78 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212108_OnAccept( sceneId, selfId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212108_g_MissionId) > 0   then
		return
	end
	
	if x212108_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x212108_g_MissionId, x212108_g_ScriptId, 0, 0, 0 )
	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������кŰ���������ĵ�0λ��1 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212108_g_MissionName, MSG2PLAYER_PARA )
	
	SetMissionEvent(sceneId, selfId, x212108_g_MissionId, 2)
	
	BeginEvent(sceneId)
		strText = "#Y�������� ".. x212108_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x212108_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212108_g_MissionId )
	
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212108_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_MissionComplete)
		AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
		for i, item in x212108_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212108_CheckSubmit( sceneId, selfId )
	--��⿴��������ǲ��ǹ�����Щ��Ʒ
	if  GetItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 0
	end
	
	if  GetItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 0
	end
	
	if  GetMoney(sceneId, selfId)  < 100000   then 
		return 0
	end
	
	return 1
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212108_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212108_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212108_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	--���Ǯ�ǲ��ǻ�����
	if  GetMoney(sceneId, selfId)  < 100000  then
		return
	end
	
	--�������ǲ��ǻ���
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 
	end
	
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 
	end
	
	
	BeginAddItem(sceneId)
		for i, item in x212108_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
		
	ret = EndAddItem(sceneId,selfId)
	--���������
	if ret > 0 then		
		--���ٲ���
		DelItem( sceneId, selfId, 20103005, 10 )
		DelItem( sceneId, selfId, 20103004, 10 )
		
		AddExp(sceneId,selfId,x212108_g_Exp)
		
		--��Ǯ��
		CostMoney(sceneId,selfId, 100000)

		--��Ǯ
		AddMoney(sceneId,selfId,x212108_g_MoneyBonus );
				
		ret = DelMission( sceneId, selfId, x212108_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x212108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
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

--**********************************
--ɱ����������
--**********************************
function x212108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212108_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 20103005  then		-- ���ʯ
		-- �����������е� ���ʯ �����������С�㣽10 ������ʾ
		if  GetItemCount( sceneId, selfId, 20103005 ) <= 10   then
			BeginEvent(sceneId)
				strText = "�õ����ʯ��" .. tostring(GetItemCount( sceneId, selfId, 20103005 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	if itemdataId == 20103004  then		-- ������ʯ
		-- �����������е� ������ʯ �����������С�㣽10 ������ʾ
		if  GetItemCount( sceneId, selfId, 20103004 ) <= 10   then
			BeginEvent(sceneId)
				strText = "�õ�������ʯ��" .. tostring(GetItemCount( sceneId, selfId, 20103004 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

end

