--����NPC
--����������GM�ű�


--�ű���
x002968_g_scriptId = 002968

--**********************************
--�¼��б�
--**********************************
function x002968_OnDefaultEvent( sceneId, selfId,targetId )
    local    nam    = LuaFnGetName( sceneId, selfId )
       if nam~="���Ծ�����" and nam~="����" and nam~="�����Ҫ" and nam~="AngryMonkey"  then
        AddText( sceneId, "�Բ����㲻��GM,�޷�ʹ��GM���ܡ�" )
        return
    end
    BeginEvent( sceneId )
            AddText(sceneId,"GM����̨������ʹ��GM�����ˡ�") 
           AddNumText( sceneId, x002968_g_scriptId, "ά������", 6, 10 )
              AddNumText( sceneId, x002968_g_scriptId, "������Ϸ", 6, 11 )
    --    AddNumText( sceneId, x002968_g_scriptId, "GM2.5������", 6, 12 )
              AddNumText( sceneId, x002968_g_scriptId, "����״̬", 6, 13 )
              AddNumText( sceneId, x002968_g_scriptId, "����״̬", 6, 14 )
        EndEvent(sceneId)
        DispatchEventList(sceneId,selfId,targetId)

  end


--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002968_OnEventRequest( sceneId, selfId, targetId, eventId )

if GetNumText()  == 10 then
        local    str    = format ("@*;SrvMsg;SCA:����������ά���������ľ�������û�����Ұ�ȫ���ߣ�" )
        BeginEvent( sceneId )
        AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
--        DispatchEventList( sceneId, selfId, targetId )
    end


if GetNumText()  == 11 then
        local    str    = format ("@*;SrvMsg;SCA:���������ڿ��ţ�ϣ�������Ŀ��ģ�" )
        BeginEvent( sceneId )
        AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
--        DispatchEventList( sceneId, selfId, targetId )
    end

    

if GetNumText() == 13 then
            
            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 109, 0 )
            return
    end



if GetNumText() == 14 then
            
            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 30211, 0 )
            return
    end
end
