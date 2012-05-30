--�ű���
x210250_g_ScriptId = 210250


x210250_g_Warning1 = "T۩ kho�n cĬ c�c h� hi�n kh�ng ��ng k� b� l�u kinh nghi�m"
x210250_g_Warning2 = "�i�� kinh nghi�m ���c chuy�n v�o ph�g l�u tr�!"
x210250_g_Warning3 = "Th�� gian online th�p h�n 1 ti�ng, c�c h� ch�a th� nh�n ���c kinh nghi�m �� l�u tr�!"
x210250_g_Warning4 = "H�m nay c�c h� �� 3 l�n nh�n �i�� kinh nghi�m l�u tr�, c�c h� kh�ng th� nh�n th�m!"

x210250_g_HuodongName = "Nh�n �i�� kinh nghi�m l�u tr�"




--**********************************
--������ں���
--**********************************
function x210250_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	local bSuccess = LuaFnGetFromIncomePool( sceneId, selfId, 1, 3600, 7200, 10800 )
	if bSuccess == 1 then					--�ʺŲ��ܷ�����Ӱ��
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning1 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )       
	elseif bSuccess == 2 then			--�����Ϊ��
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning2 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )   
	elseif bSuccess == 3 then			--����ʱ��С��1Сʱ��������ȡ
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning3 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )  
	elseif bSuccess == 4 then			--�����Ѿ���ȡ��3�Σ������ٴ���ȡ��
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning4 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )    
	elseif bSuccess == 0 then			--��ȡ�ɹ�
		--�رս���
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	
end



--**********************************
--�о��¼�
--**********************************
function x210250_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x210250_g_ScriptId,x210250_g_HuodongName,1,-1);
end



--**********************************
--����������
--**********************************
function x210250_CheckAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x210250_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210250_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210250_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210250_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210250_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x210250_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--���������¼�
--**********************************
function x210250_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210250_OnItemChanged( sceneId, selfId, itemdataId )
end


