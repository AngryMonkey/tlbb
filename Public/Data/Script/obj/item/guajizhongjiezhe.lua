--�һ��ս���

--�ű���

x300026_g_scriptId = 300026


--**********************************
--�¼��������
--**********************************
function x300026_OnDefaultEvent( sceneId, selfId, BagIndex )
end

--**********************************
--�����¼�
--**********************************
function x300026_OnDie( sceneId, selfId, killerId )

	local nObjType = GetCharacterType(sceneId, killerId);
	if nObjType then
		local nHumanId = -1;
		if nObjType == 1 then
			nHumanId = killerId;
		elseif nObjType == 3 then
			nHumanId = GetPetCreator(sceneId, killerId);
		end
		
		if nHumanId ~= -1 then
			LuaFnSendGuajiQuestion(sceneId, nHumanId);
		end
	end
end



