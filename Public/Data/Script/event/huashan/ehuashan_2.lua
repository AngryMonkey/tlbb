--001231
--�ӻ�ɽ�۽��ص����Ե����ɳ��������������ˡ�

x001231_g_ScriptId = 001231


--**********************************
--������ں���
--**********************************
function x001231_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText() == 0   then
		-- ִ�д��ͻ��Լ����ɵĲ���
		local nMenpaiScene
		local nPos_X
		local nPos_Z
		local nMempai = LuaFnGetMenPai(sceneId, selfId)
		if 		 nMempai == 0    then
			nMenpaiScene = 9
			nPos_X			 = 62
			nPos_Z			 = 63
		elseif nMempai == 1    then
			nMenpaiScene = 11
			nPos_X			 = 82
			nPos_Z			 = 57
		elseif nMempai == 2    then
			nMenpaiScene = 10
			nPos_X			 = 42
			nPos_Z			 = 145
		elseif nMempai == 3    then
			nMenpaiScene = 12
			nPos_X			 = 99
			nPos_Z			 = 69
		elseif nMempai == 4    then
			nMenpaiScene = 15
			nPos_X			 = 97
			nPos_Z			 = 74
		elseif nMempai == 5    then
			nMenpaiScene = 16
			nPos_X			 = 126
			nPos_Z			 = 77
		elseif nMempai == 6    then
			nMenpaiScene = 13
			nPos_X			 = 37
			nPos_Z			 = 86
		elseif nMempai == 7    then
			nMenpaiScene = 17
			nPos_X			 = 100
			nPos_Z			 = 46
		elseif nMempai == 8    then
			nMenpaiScene = 14
			nPos_X			 = 61
			nPos_Z			 = 69
		elseif nMempai == 9    then
			--û�����ɵ���Ӧ���ǲ����ֵģ����������֣����ø�λ��
			nMenpaiScene = 1
			nPos_X			 = 191
			nPos_Z			 = 138
			--PrintStr("������һ����K�Ķ���֪���Լ������ˣ�����")
		end
		
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMenpaiScene, nPos_X, nPos_Z)
		
		-- �����������뿪�����ʱ�仹�ڿ��Ա�����ʱ�䣬��ô֪ͨ��������Ա
		

	end
end

--**********************************
--�о��¼�
--**********************************
function x001231_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x001231_g_ScriptId, "��ɱ�������ˣ�����", 0, 0);
end

--**********************************
--��ⴥ������
--**********************************
function x001231_CheckAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x001231_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x001231_OnAbandon( sceneId, selfId )

end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x001231_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x001231_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ����ɣ�
--**********************************
function x001231_OnSubmit( sceneId, selfId,targetId,selectRadioID )

end

--**********************************
--ɱ����������
--**********************************
function x001231_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x001231_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x001231_OnItemChanged( sceneId, selfId, itemdataId )
end

