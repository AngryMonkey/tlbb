--ת�Ե�NPC ����

--�ű���
x000147_g_scriptId = 000147


--��ӵ�е��¼�ID�б�
x000147_g_eventList={0147000, 0147001, 0147002, 0147003, 0147004, 0147005, 0147006}
x000147_g_item_zhuanxingdan = 30900048


x000147_g_result_msg = {
	"#{ZXD_20080312_03}", --"���ѳɻ��޷������Ա�����������ϵ����ʹ�ø���Ʒ"
	"#{ZXD_20080318_01}", --"����̫Զ��ת�Ե�ʹ��ʧ��"
	"#{ZXD_20080318_02}", --"û�п��õ�ת�Ե�",
	"#{ZXD_20080318_03}", --"���ʱ�޷�ת�ԣ����˳����״̬����ʹ��",
	"#{ZXD_20080318_04}", --"��̯״̬ʱ�޷�ʹ��ת�Ե�",
	"#{ZXD_20080318_05}"  --"��״̬�޷�ʹ��ת�Ե�"
}

--**********************************
--�¼��б�
--**********************************
function x000147_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#{ZXD_20080312_01}" )
		AddNumText( sceneId, x000147_g_scriptId, "#{ZXD_20080318_06}", 6, 0147000)
		AddNumText( sceneId, x000147_g_scriptId, "#{ZXD_20080318_07}", 11, 0147001)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000147_OnDefaultEvent( sceneId, selfId,targetId )
	x000147_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �¼�����
--**********************************
function x000147_OnEventRequest( sceneId, selfId, targetId, eventId )
	local request_id = GetNumText()
	print("function x000147_OnEventRequest")
	if request_id == 0147000 then
		local isMarried = LuaFnIsMarried(sceneId, selfId)
		if isMarried > 0 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{ZXD_20080312_03}" )		
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x000147_g_item_zhuanxingdan)
		if itemCount < 1 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{ZXD_20080312_04}" )		
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		--֪ͨ�ͻ��˿�ʼת��ѡ��
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147000)
		
	elseif request_id == 0147003 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147005)
		
	elseif request_id == 0147004 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147006) --�ر�NPC�Ի���
		
	elseif request_id == 0147001 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZXD_20080312_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
-- ����ȷ�Ͻ���
--**********************************
function x000147_OnZhuanXingRequest( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{ZXD_20080312_05}")
		AddNumText( sceneId, x000147_g_scriptId, "��", 6, 0147003)
		AddNumText( sceneId, x000147_g_scriptId, "��", 6, 0147004)		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
-- �ͻ��˵��ú���
--**********************************
function x000147_OnZhuanXingConfirm( sceneId, selfId, targetId, sex, hairColor, hairModel, faceModel, nFaceId)
	print("x000147_OnZhuanXingConfirm")
	local pre_condition = x000147_PreZhuanXingCondition( sceneId, selfId, targetId )
	if pre_condition == 0 then
		local is_suc = HumanZhuanXing(sceneId, selfId, sex, hairColor, hairModel, faceModel, nFaceId)
		if is_suc == 1 then
			LuaFnDelAvailableItem(sceneId, selfId, x000147_g_item_zhuanxingdan, 1)
			BeginEvent(sceneId)
				AddText(sceneId, "#{ZXD_20080312_06}")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			--����ͬʱ��һ��������Ч
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 100 )
			return
		end
	elseif( pre_condition >= 1 and pre_condition <= 6 ) then
		BeginEvent(sceneId)
			AddText(sceneId, x000147_g_result_msg[pre_condition])
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end


--**********************************
-- �Ƿ�����ת������
--**********************************
function x000147_PreZhuanXingCondition( sceneId, selfId, targetId )
	
	--�Ѿ����
	local isMarried = LuaFnIsMarried(sceneId, selfId)
	if isMarried == 1 then
		return 1
	end
	
	--����̫Զ
	local isValidDistance = IsInDist( sceneId, selfId, targetId, 1000.0)
	if isValidDistance <= 0 then
		return 2
	end
	
	--û�кϷ���Ʒ
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x000147_g_item_zhuanxingdan)
	if itemCount <= 0 then
		return 3
	end
	
	--�Ƿ����
	local hasTeam = LuaFnHasTeam(sceneId, selfId)
	if hasTeam > 0 then
		return 4
	end
	
	--�Ƿ��̯
	local isStall = LuaFnIsStalling(sceneId, selfId)
	if isStall > 0 then
		return 5
	end

	--�Ƿ����
	local isRiding = LuaFnIsRiding(sceneId, selfId)
	if isRiding > 0 then
		return 6
	end
	
	--����ת��
	return 0
end
