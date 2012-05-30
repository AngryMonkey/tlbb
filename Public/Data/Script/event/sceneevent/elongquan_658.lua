--ɱ�֣��ڽ������ͬʱ������Ҫɱ�Ĺ�
--���һ��

--MisDescBegin
--�ű���
x212109_g_ScriptId = 212109

--�����
x212109_g_MissionId = 658

--Ŀ��NPC
x212109_g_Name	="����"

--�������
x212109_g_MissionKind = 42

--����ȼ�
x212109_g_MissionLevel = 38

--�Ƿ��Ǿ�Ӣ����
x212109_g_IfMissionElite = 0

--������
x212109_g_MissionName="���һ��"
--��������
x212109_g_MissionInfo="#{Lua_Longquan_0001}"
--����Ŀ��
x212109_g_MissionTarget="#G��Ȫ����#W��#R����#W#{_INFOAIM51,115,31,����}Ҫ����ɱ��#Rͨ��#W��#Rͨ��#W#{_INFOAIM48,51,31,-1}������#G����ͤ#W�������֡�"		
--δ��������npc�Ի�
x212109_g_ContinueInfo="  ���Ѿ�ɱ��ͨ������"
--�ύʱnpc�Ļ�
x212109_g_MissionComplete="  һ�ж����������Ƿ��Һ���֮֮��Ҳ���и��˶��ˡ���"		

x212109_g_MoneyBonus=4000
x212109_g_exp=20000

--x212109_g_ItemBonus={{id=10111011, num=1}}

x212109_g_RadioItemBonus={{id=10421066 ,num=1},{id=10411073,num=1},{id=10410067,num=1}}

x212109_g_Custom	= { {id="��ɱ��ͨ��",num=1} }

x212109_g_IsMissionOkFail = 0		--�����ĵ�0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212109_OnDefaultEvent( sceneId, selfId, targetId )

  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x212109_g_MissionName)
			AddText(sceneId, x212109_g_ContinueInfo)
		EndEvent( )
		local bDone = x212109_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId,bDone)
				
	--���������������
  elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212109_g_MissionName)
			AddText(sceneId,x212109_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212109_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
			for i, item in x212109_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212109_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 2, -1)
	--���������������
	elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 1, -1)
	end
end

--**********************************
--����������
--**********************************
function x212109_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�ǰ������
	if IsMissionHaveDone(sceneId,selfId,656) <= 0 then		--���Ż���
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,657) <= 0 then		--���Ż���
		return 0
	end
	
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= x212109_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212109_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	end

	-- ��������ϼ�һ������
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002152, 1)
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		-- ������������б�
		local ret = AddMission( sceneId,selfId, x212109_g_MissionId, x212109_g_ScriptId, 1, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)

		--���������������ĳ�����ź�����λ��
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212109_g_MissionId)--�õ�������20�������е����к�
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����
	
		Msg2Player(  sceneId, selfId,"#Y��������" .. x212109_g_MissionName, MSG2PLAYER_PARA )

		BeginEvent(sceneId)
			strText = "#Y�������� ".. x212109_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
	
		Msg2Player(  sceneId, selfId,"#Y��ı�������", MSG2PLAYER_PARA )
	end	

end	

--**********************************
--����
--**********************************
function x212109_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212109_g_MissionId )
	
	--ɾ��������Ʒ
	DelItem( sceneId, selfId, 40002152, 1 )
end

--**********************************
--����
--**********************************
function x212109_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212109_g_MissionName)
		AddText(sceneId,x212109_g_MissionComplete)
		AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
		for i, item in x212109_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212109_CheckSubmit( sceneId, selfId )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212109_g_MissionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x212109_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212109_g_MissionId) <= 0 then
		return
	end
	
	-- 2����������������
	if x212109_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212109_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		--ɾ��������Ʒ
		DelItem( sceneId, selfId, 40002152, 1 )
		AddItemListToHuman(sceneId,selfId)
		-- ��Ǯ�;���
		AddMoney(sceneId,selfId,x212109_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212109_g_exp)
		
		DelMission( sceneId,selfId, x212109_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId, x212109_g_MissionId )
	else
		--������û�мӳɹ�
		BeginEvent(sceneId)
			AddText(sceneId, "��������,�޷��������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
		
end

--**********************************
--ɱ����������
--**********************************
function x212109_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	-- ��������ǲ����Ѿ����
	if x212109_CheckSubmit(sceneId, selfId) > 0    then
		return
	end
	
	if monsterName == "ͨ��"   then
		--ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x212109_g_MissionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212109_g_MissionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("��ɱ��ͨ�죺1/1" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					-- �����������
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212109_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212109_OnItemChanged( sceneId, selfId, itemdataId )
end

