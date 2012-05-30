--���츱��

x401030_g_ScriptId = 401030;				-- �ű���

x401030_g_CopySceneName = "�������";		-- ��������
x401030_g_CopySceneType = FUBEN_WEDDING;	-- �������ͣ�������ScriptGlobal.lua����
x401030_g_TickElapse = 5;					-- �ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x401030_g_LimitTickCount = 500;				-- ���������������ƣ���λ��������
x401030_g_CloseTick = 6;					-- �����ر�ǰ����ʱ������������λ��������
x401030_g_NoUserTime = 300;					-- ������û���˺���Լ��������ʱ�䣨��λ���룩
x401030_g_Fuben_X = 40;						-- ��������λ��X
x401030_g_Fuben_Z = 45;						-- ��������λ��Z
x401030_g_Back_X = 175;						-- ��������λ��X
x401030_g_Back_Z = 95;						-- ��������λ��Z

x401030_g_closeEventNotifyText_minute = "��������%d���Ӻ�ر�!";
x401030_g_closeEventNotifyText_second = "�㽫��%d����뿪����!";

x401030_g_invitationDataId_level1  = 30303100;		-- ��ͨ����ID
x401030_g_invitationDataId_level2  = 30303101;		-- �߼�����ID
x401030_g_invitationDataId_level3  = 30303102;		-- ��������ID

--**********************************
--��������
--**********************************
function x401030_Create(sceneId, selfId, marryTargetId, weddingLevel)

	local selfGUID, marryTargetGUID;
	selfGUID = -1;
	marryTargetGUID = -1;
	if selfId and selfId ~= -1 then
		selfGUID  = LuaFnObjId2Guid(sceneId, selfId);
	end
	
	if marryTargetId and marryTargetId ~= -1 then
		marryTargetGUID = LuaFnObjId2Guid(sceneId, marryTargetId);
	end
	
	if selfGUID and selfGUID ~= -1 and marryTargetGUID and marryTargetGUID ~= -1 then
	else
		return 0;
	end
	
	if weddingLevel == 1 then
		LuaFnSetSceneLoad_Map(sceneId, "wedding_2.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_2_monster.ini");
	elseif weddingLevel == 2 then
		LuaFnSetSceneLoad_Map(sceneId, "wedding_3.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_3_monster.ini");
	else
		LuaFnSetSceneLoad_Map(sceneId, "wedding_1.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_1_monster.ini");
	end
	
	LuaFnSetCopySceneData_TeamLeader(sceneId, selfGUID);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401030_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401030_g_TickElapse * 1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401030_g_CopySceneType);				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401030_g_ScriptId);					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);										--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);									--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);										--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);										--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, selfGUID);								--���������˵�GUID
	LuaFnSetCopySceneData_Param(sceneId, 7, marryTargetGUID);							--����Ů���˵�GUID
	LuaFnSetCopySceneData_Param(sceneId, 8, weddingLevel);							--������񼶱�
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, 0);					--����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene(sceneId);								--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x401030_NotifyTips(sceneId, selfId, "���������ɹ���");
	else
		x401030_NotifyTips(sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�");
	end
end

--**********************************
--��������
--**********************************
function x401030_Close(sceneId, selfId)
	local selfGUID = LuaFnGetGUID(sceneId, selfId);
	local marryCharGUID_A, marryCharGUID_B;
	marryCharGUID_A = LuaFnGetCopySceneData_Param(sceneId, 6);
	marryCharGUID_B = LuaFnGetCopySceneData_Param(sceneId, 7);
	local bSelfWedding = 0;
	if selfGUID and marryCharGUID_A and marryCharGUID_B then
		if marryCharGUID_A < 0 then
			marryCharGUID_A = marryCharGUID_A + 4294967296;
		end
		if marryCharGUID_B < 0 then
			marryCharGUID_B = marryCharGUID_B + 4294967296;
		end
		if selfGUID == marryCharGUID_A or selfGUID == marryCharGUID_B then
			bSelfWedding = 1;
		end
	end

	if bSelfWedding == 1 then
		local tempParam = LuaFnGetCopySceneData_Param(sceneId, 4);
		if tempParam == 0 then
			LuaFnSetCopySceneData_Param(sceneId, 4, 1);
			BroadMsgByChatPipe(sceneId, selfId, "�����Ѿ�������ϣ����������رգ������ٶ��뿪��лл��ҵĲ��룡", 2);
		end
	end
end

--**********************************************************
--��ҽ��븱��
--selfId		:	Ҫ���븱�������ID
--targetGUID	:	����˭�ĸ������л�Ů���ǵ�GUID��
--**********************************************************
function x401030_PlayerEnter(sceneId, selfId, targetId, targetGUID)
	if targetGUID and selfId then
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		if targetGUID < 0 then
			targetGUID = targetGUID + 4294967296;
		end
		local checkRet = 0;
		if selfGUID and selfGUID == targetGUID then
			checkRet = 1;
		else
			local itemIdList = {x401030_g_invitationDataId_level3, x401030_g_invitationDataId_level2, x401030_g_invitationDataId_level1};
			local itemId;
			local itemPos;
			for _, itemId in itemIdList do
				local i, maxCount;
				maxCount = 100;
				itemPos = 0;
				for i = 0, maxCount - 1 do
					itemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, itemId, itemPos);
					if itemPos and itemPos > -1 then
						local creatorGUID = GetBagItemParam(sceneId, selfId, itemPos, 0, 2);
						if creatorGUID and creatorGUID == targetGUID then
							checkRet = 1;
							break;
						end
						itemPos = itemPos + 1;
					else
						break;
					end
				end
				if checkRet == 1 then
					break;
				end
			end
		end

		if checkRet == 1 then
			local destSceneId = FindCopySceneIDByCopySceneParams(sceneId, x401030_g_CopySceneType, 1, 6, targetGUID);
			if destSceneId and destSceneId >= 0 then
			else
				destSceneId = FindCopySceneIDByCopySceneParams(sceneId, x401030_g_CopySceneType, 1, 7, targetGUID);
			end
			
			if destSceneId and destSceneId >= 0 then
				local leaveFlag = LuaFnGetCopySceneData_Param(destSceneId, 4);
				if leaveFlag == 1 then
					x401030_MessageBox(sceneId, selfId, targetId, "�Բ����������������������ڹر�֮�С�");
				else
					NewWorld(sceneId, selfId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
					return 1;
				end
			else
				x401030_MessageBox(sceneId, selfId, targetId, "�Բ�������û�и����������˵Ļ���");
			end
		else
			x401030_MessageBox(sceneId, selfId, targetId, "�Բ�������û�и����������˵Ļ���");
		end
	end
	return 0;
end

--**********************************
--����˳�����
--**********************************
function x401030_PlayerExit(sceneId, selfId)
	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ�ø�����ڳ�����
		
		--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if memId == selfId then
				NewWorld(sceneId, selfId, oldsceneId, x401030_g_Back_X, x401030_g_Back_Z);
				return 
			end
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x401030_OnCopySceneReady(sceneId, destSceneId)

	LuaFnSetCopySceneData_Param(destSceneId, 3, sceneId);			--���ø�����ڳ�����
	
	local selfGUID  = LuaFnGetCopySceneData_Param(destSceneId, 6);
	local marryTargetGUID  = LuaFnGetCopySceneData_Param(destSceneId, 7);
	
	if selfGUID and selfGUID ~= -1 and marryTargetGUID and marryTargetGUID ~= -1 then
	else
		return 0;
	end

	local selfId, marryTargetId;
	selfId = -1;
	marryTargetId = -1;
	if selfGUID and selfGUID ~= -1 then
		selfId = LuaFnGuid2ObjId(sceneId, selfGUID);
	end
	
	if marryTargetGUID and marryTargetGUID ~= -1 then
		marryTargetId = LuaFnGuid2ObjId(sceneId, marryTargetGUID);
	end

	if selfId and selfId ~= -1 then
		if LuaFnIsCanDoScriptLogic(sceneId, selfId) ~= 1 then
			return 
		end
	end

	if marryTargetId and marryTargetId ~= -1 then
		if LuaFnIsCanDoScriptLogic(sceneId, marryTargetId) ~= 1 then
			return 
		end
	end
	
	if selfId and selfId ~= -1 then
		NewWorld(sceneId, selfId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
	end
	
	if marryTargetId and marryTargetId ~= -1 then
		NewWorld(sceneId, marryTargetId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x401030_OnPlayerEnter(sceneId, selfId)
end

--**********************************
--������ڸ����������¼�
--**********************************
function x401030_OnHumanDie(sceneId, selfId, killerId)
end

--**********************************
--����������ʱ���¼�
--**********************************
function x401030_OnCopySceneTimer(sceneId, nowTime)
	
	--����ʱ�Ӷ�ȡ������
	local tickCount = LuaFnGetCopySceneData_Param(sceneId, 2);	--ȡ���Ѿ�ִ�еĶ�ʱ����
	tickCount = tickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, tickCount);		--�����µĶ�ʱ�����ô���
		
	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4);
	
	if leaveFlag == 1 then --��Ҫ�뿪

		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5);
		leaveTickCount = leaveTickCount + 1;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount);
		
		if leaveTickCount > x401030_g_CloseTick or leaveTickCount == x401030_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);--ȡ�ø�����ڳ�����
			
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local mems = {};
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				NewWorld(sceneId, mems[i], oldsceneId, x401030_g_Back_X, x401030_g_Back_Z);
			end
			
		elseif leaveTickCount < x401030_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);--ȡ�ø�����ڳ�����

			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local mems = {};
	  		local strText = format(x401030_g_closeEventNotifyText_second, (x401030_g_CloseTick-leaveTickCount)*x401030_g_TickElapse);
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				x401030_NotifyTips(sceneId, mems[i], strText);
			end
		end

	elseif tickCount > x401030_g_LimitTickCount or tickCount == x401030_g_LimitTickCount then
		LuaFnSetCopySceneData_Param(sceneId, 4, 1);
		return
	else
		local tempSecond = (x401030_g_LimitTickCount - tickCount) * x401030_g_TickElapse;
		local tempMinute = floor(tempSecond / 60);
		if tempMinute * 60 == tempSecond then
			local bNotify = 0;
			if tempMinute > 10 then
				local tempValue = floor(tempMinute / 10);
				if tempValue * 10 == tempMinute then
					bNotify = 1;
				end
			elseif tempMinute > 1 then
				bNotify = 1;
			end
			
			if bNotify == 1 then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				local mems = {};
				local strText = format(x401030_g_closeEventNotifyText_minute, tempMinute);
				for	i=0,membercount-1 do
					mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					x401030_NotifyTips(sceneId, mems[i], strText);
				end
			end
		end
	end
end

function x401030_NotifyTips(sceneId, selfId, tipText)
	BeginEvent(sceneId);
		AddText(sceneId, tipText);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x401030_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end
