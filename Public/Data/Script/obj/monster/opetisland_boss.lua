--���䵺BOSS��

--�ű����
x501999_g_ScriptId	= 501999

--**********************************
--Monster Timer
--**********************************
function x501999_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--ȫ�򹫸�

	str	= format( "#G���䵺#P�ϵ�����#{_BOSS49}#P�Ѿ����֣����λ�����������䵺�շ����Է���Σ�����ա�" )
	AddGlobalCountNews( sceneId, str )

	--ȡ��ʱ��
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--�����¼�
--**********************************
function x501999_OnDie( sceneId, objId, killerId )

	--ȫ�򹫸�
	local	nam_ply	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		nam_ply = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		nam_ply = GetName( sceneId, leaderID )
	end
	
	if nam_ply ~= nil then
		str	= format( "#P����#W#{_INFOUSR%s}#P��������һ����ս��#{_BOSS49}#P���ڱ�����ˡ�", nam_ply )
		AddGlobalCountNews( sceneId, str )
	end
	
end
