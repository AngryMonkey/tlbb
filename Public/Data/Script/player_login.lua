-- ��¼����
--������ʱ����	��ҵ�¼��Ϸ�󴥷��˽ű�
--������Դ��		.\Scene.lua: OnScenePlayerLogin

--�ű���
x888890_g_ScriptId	= 888890

--**********************************
--�ű���ں���
--**********************************
function x888890_OnDefaultEvent( sceneId, selfId )

	--�����䷽
	x888890_AdjustPrescription( sceneId, selfId )
	
	--����ʺ��Ƿ�ȫ
	CheckAccountSafe( sceneId, selfId );
	
	--��������

end

--**********************************
--�����䷽
--**********************************
--ɾ���Ѿ��������䷽�����û���Զ���ӵ��䷽
function x888890_AdjustPrescription( sceneId, selfId )

	--��Ҫɾ�����䷽
	local	preOld	= { 166, 167, 168, 169, 170, 171, 172, 173, 174, 175,
										176, 177, 178, 179, 180, 181, 182, 183, 184, 185,
										186, 187, 188, 189, 190, 191, 192, 193, 194, 195,
										196, 197, 198, 199, 200, 201, 202, 203, 204, 205,
										206, 207, 208, 209, 210, 211, 212, 213, 214, 215,
										216, 217, 218, 219, 220, 221, 222, 223, 224, 225,
										226, 227, 228, 229, 230, 231, 232, 233 }
	--��Ҫ��ӵ��䷽
	local	preNew	= { 558, 559, 560 }
	
	local	id
	--Del
	for _, id in preOld do
		if IsPrescrLearned( sceneId, selfId, id ) == 1 then
			SetPrescription( sceneId, selfId, id, 0 )
		end
	end
	--Add
	for _, id in preNew do
		if IsPrescrLearned( sceneId, selfId, id ) == 0 then
			SetPrescription( sceneId, selfId, id, 1 )
		end
	end

end
