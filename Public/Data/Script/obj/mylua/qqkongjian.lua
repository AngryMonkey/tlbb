--210500
-- V:\�߻��ĵ�\�߻��ĵ�Ŀ¼�ṹ\2 ����ĵ�\2.1 ��Ϸ��λ���\�ر���Ʒ\�������Ʒ������.docx
-- 
-- 

--�ű���
x210500_g_scriptId = 210500
x210500_g_ItemId = 39901038
x210500_g_ItemId01 = 39901038
x210500_g_BuffId = 56

--**********************************
--�¼��������
--**********************************
function x210500_OnDefaultEvent( sceneId, selfId, nBagIndex )
	--1�������������ǲ�����BUFF
	local nCurCount = GetBagItemParam(sceneId, selfId, nBagIndex, 4, 2)
	SetBagItemParam(sceneId, selfId, nBagIndex, 8, 2, 30)
	-- ��ȫ���
	if LuaFnGetItemTableIndexByIndex(sceneId, selfId, nBagIndex) ~= x210500_g_ItemId
		 and LuaFnGetItemTableIndexByIndex(sceneId, selfId, nBagIndex) ~= x210500_g_ItemId01 then
		BeginEvent(sceneId)
			AddText(sceneId,"��Ʒ����ʹ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local ret = 1
	if nCurCount >= 29  then
		-- �ж��������Ʒ��ID�ǲ�����ȷ��
		ret = EraseItem(sceneId, selfId, nBagIndex)
	else
		SetBagItemParam(sceneId, selfId, nBagIndex, 4, 2, nCurCount+1)
	end

	if ret == 1   then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 76,110, 10 )
		BeginEvent(sceneId)
			AddText(sceneId,"�������QQ�ռ䡣")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"��Ʒ����ʹ�á�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	LuaFnRefreshItemInfo(sceneId, selfId, nBagIndex)
	
end

function x210500_IsSkillLikeScript( sceneId, selfId)
	return 0
end
