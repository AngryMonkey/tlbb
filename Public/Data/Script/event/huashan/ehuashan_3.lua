--001232
--�ӻ�ɽ�۽��ص����Ե����ɳ��������������ˡ�

x001232_g_ScriptId = 001232


--**********************************
--������ں���
--**********************************
function x001232_OnDefaultEvent( sceneId, selfId, targetId )

	--ս����ʼ�󣬲��ܰ������˴��͵���ս��������ڻ�������б�־��
	-- 1��ʱ�䵽��
	

	-- 2������

	if GetNumText() == 0   then
		-- ִ�д��ͻ��Լ����ɵĲ���
		local nPos_X
		local nPos_Z
		local nMempai = LuaFnGetMenPai(sceneId, selfId)
		if 		 nMempai == 0    then
			nPos_X			 = 135
			nPos_Z			 = 54
		elseif nMempai == 1    then
			nPos_X			 = 68
			nPos_Z			 = 107
		elseif nMempai == 2    then
			nPos_X			 = 200
			nPos_Z			 = 115
		elseif nMempai == 3    then
			nPos_X			 = 170
			nPos_Z			 = 189
		elseif nMempai == 4    then
			nPos_X			 = 108
			nPos_Z			 = 189
		elseif nMempai == 5    then
			nPos_X			 = 199
			nPos_Z			 = 162
		elseif nMempai == 6    then
			nPos_X			 = 72
			nPos_Z			 = 150
		elseif nMempai == 7    then
			nPos_X			 = 92
			nPos_Z			 = 61
		elseif nMempai == 8    then
			nPos_X			 = 188
			nPos_Z			 = 78
		elseif nMempai == 9    then
			--û�����ɵ���Ӧ���ǲ����ֵģ����������֣����ø�λ��
			nPos_X			 = 191
			nPos_Z			 = 138
		end
		SetPos(sceneId, selfId, nPos_X, nPos_Z)	

	end
end

--**********************************
--�о��¼�
--**********************************
function x001232_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x001232_g_ScriptId, "�������볡Ϊʦ�ų����ɣ�����", 0, 0);
end

--**********************************
--��ⴥ������
--**********************************
function x001232_CheckAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x001232_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x001232_OnAbandon( sceneId, selfId )

end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x001232_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x001232_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ����ɣ�
--**********************************
function x001232_OnSubmit( sceneId, selfId,targetId,selectRadioID )

end

--**********************************
--ɱ����������
--**********************************
function x001232_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x001232_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x001232_OnItemChanged( sceneId, selfId, itemdataId )
end
