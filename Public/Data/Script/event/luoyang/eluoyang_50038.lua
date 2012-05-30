--�μӻ���

x250038_g_ScriptId = 250038;

x250038_g_eventId_updateJoinList = -1;				-- ˢ���ܼ�����б�(Ҫ��֤��ֵ��������ҵ�GUID��ͬ)

x250038_g_invitationDataId_level1  = 30303100;		-- ��ͨ����ID
x250038_g_invitationDataId_level2  = 30303101;		-- �߼�����ID
x250038_g_invitationDataId_level3  = 30303102;		-- ��������ID

--**********************************
--������ں���
--**********************************
function x250038_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	local selectEventId = GetNumText();
	if selectEventId then
		if selectEventId == x250038_g_eventId_updateJoinList then
			x250038_OnUpdateJoinList(sceneId, selfId, targetId);
		else
			local creatorGUID = GetNumText();
			x250038_OnJoin(sceneId, selfId, targetId, creatorGUID);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x250038_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x250038_g_ScriptId, "�μӻ���", 6, x250038_g_eventId_updateJoinList);
end

--**********************************
--ˢ�¿��ܲμӵĻ����б�
--**********************************
function x250038_OnUpdateJoinList(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local addText = 0;
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local destSceneId = FindCopySceneIDByCopySceneParams(sceneId, FUBEN_WEDDING, 1, 6, selfGUID);
		if destSceneId and destSceneId >= 0 then
		else
			destSceneId = FindCopySceneIDByCopySceneParams(sceneId, FUBEN_WEDDING, 1, 7, selfGUID);
		end
		
		local creatorNum = 0;
		local creatorList = {};
		if destSceneId and destSceneId ~= -1 then
			if addText == 0 then
				AddText(sceneId, "��ѡ����Ҫ�μӵĻ���");
				addText = 1;
			end
			creatorList[creatorNum + 1] = selfGUID;
			creatorNum = creatorNum + 1;
			AddNumText(sceneId, x250038_g_ScriptId, "���һص��ҵĻ��񸱱�", 9, selfGUID);
		end
		
		local itemIdList = {x250038_g_invitationDataId_level3, x250038_g_invitationDataId_level2, x250038_g_invitationDataId_level1};
		local itemId;
		local itemPos;
		for _, itemId in itemIdList do
			local i, maxCount;
			maxCount = 100;
			itemPos = 0;
			for i = 0, maxCount - 1 do
				itemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, itemId, itemPos);
				if itemPos and itemPos > -1 then
					local ret, creatorName = LuaFnGetItemCreator(sceneId, selfId, itemPos);
					if ret and creatorName and ret == 1 then
						local creatorGUID = GetBagItemParam(sceneId, selfId, itemPos, 0, 2);
						if addText == 0 then
							AddText(sceneId, "��ѡ����Ҫ�μӵĻ���");
							addText = 1;
						end
						
						local findGUID, bFind;
						bFind = 0;
						for _, findGUID in creatorList do
							if findGUID == creatorGUID then
								bFind = 1;
								break;
							end
						end
						
						if bFind == 0 then
							creatorList[creatorNum + 1] = creatorGUID;
							creatorNum = creatorNum + 1;
							AddNumText(sceneId, x250038_g_ScriptId, "�μ�"..creatorName.."�Ļ���", 8, creatorGUID);
						end
					end
					itemPos = itemPos + 1;
				else
					break;
				end
			end
		end
		if addText == 0 then
			AddText(sceneId, "������û�п��õĽ���������޷��μ��κλ���");
		end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--����μӻ�����¼�
--**********************************
function x250038_OnJoin(sceneId, selfId, targetId, creatorGUID)
	CallScriptFunction(401030, "PlayerEnter", sceneId, selfId, targetId, creatorGUID);
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x250038_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end
