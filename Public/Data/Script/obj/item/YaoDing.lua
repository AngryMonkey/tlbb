--ҩ�� �������

--�ű���
x300041_g_scriptId = 300041


--**********************************
--ˢ���¼�
--**********************************
function x300041_OnDefaultEvent( sceneId, selfId, BagIndex )
	
		local growPointType = 776;
--		local ItemBoxId = ItemBoxEnterScene( 72, 55, growPointType, sceneId, 1,1, 30505075 )	
--		SetItemBoxMaxGrowTime(sceneId,ItemBoxId,5*1000)	--�趨����ʱ��
--		local itemBoxId = LuaFnItemBoxEnterSceneEx(sceneId, 72, 55, 775, 5*1000);
--		AddItemToBox(sceneId, itemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505075);
	
	--ItemBoxEnterScene(70,56,-1,sceneId,1,1,30505075)

	if sceneId~= 5 then
		return 0;
	end	

	local actId = 36;
	local idSceneJingHu = 5;
	
	local LianYaoStatus = GetActivityParam( idSceneJingHu, actId, 0 );
	
	if LianYaoStatus <= 0 then
		
		return 0;
	end
	
	--���ɵ���Ч
	local QianNianCaoGen = GetActivityParam( idSceneJingHu, actId, 1 );
	if QianNianCaoGen <= 0 then
		return 0;
	end
	--ȷ�� û�� ҩ��
	local YaoDing_LianYao_Status = GetActivityParam( idSceneJingHu, actId, 2 );
	if YaoDing_LianYao_Status ~= 1 then
		return 0;
	end
	--�Ƿ�Ϊ ����
	local idGUIDCur = LuaFnGetGUID(sceneId, selfId);	
	local idGUIDSaved = GetActivityParam( idSceneJingHu, actId, 3 );
	if idGUIDSaved < 0 then
		idGUIDSaved = idGUIDSaved + 4294967296;
	end
	if idGUIDSaved ~= idGUIDCur then
		return 0;
	end
	
	local nCurTime = LuaFnGetCurrentTime();
	local nStartTime = GetActivityParam( idSceneJingHu, actId, 4 );
	local nDelta = nCurTime - nStartTime;
	local nNow = floor( ( 60*15 - nDelta ) / 60 );
	
	local sMsg;
	sMsg = format("��ҩ�Ľ���: ��ʣ��#c00ff00"..nNow.."����#cffffff��");
	--��Ҫ�ڴ˴���ָ����NPC
	BeginEvent(sceneId)
	
		AddText(sceneId, sMsg);
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end

function x300041_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
