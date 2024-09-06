//Para utilizar esse é necessário instalar a biblioteca Serial Communication e xls link, caso não tenha instalado utilize o comando --> atomsInstall("serial") e atomsInstall("xls_link").
//Então, de load nas bilioteca com atomsLoad ("name") ou reinicie o scilab.
clear;
clc;

global COM_Wait;

f=figure('figure_position',[400,50],'figure_size',[640,480],'auto_resize','on','background',[34],'figure_name','Janela gráfica número %d','color_map',[0,0,0;0,0,1;0,1,0;0,1,1;1,0,0;1,0,1;1,1,0;1,1,1;0,0,0.5647059;0,0,0.6901961;0,0,0.8156863;0.5294118,0.8078431,1;0,0.5647059,0;0,0.6901961,0;0,0.8156863,0;0,0.5647059,0.5647059;0,0.6901961,0.6901961;0,0.8156863,0.8156863;0.5647059,0,0;0.6901961,0,0;0.8156863,0,0;0.5647059,0,0.5647059;0.6901961,0,0.6901961;0.8156863,0,0.8156863;0.5019608,0.1882353,0;0.627451,0.2509804,0;0.7529412,0.3764706,0;1,0.5019608,0.5019608;1,0.627451,0.627451;1,0.7529412,0.7529412;1,0.8784314,0.8784314;1,0.8431373,0;0.8,0.8,0.8;0.9333333,0.9333333,0.9333333],'dockable','off','infobar_visible','off','toolbar_visible','off','menubar_visible','off','default_axes','on','visible','off');
//////////
handles.dummy = 0;
handles.COM_Port=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.1394872,0.3554875,0.4166667,0.2993197],'Relief','default','SliderStep',[0.01,0.1],'String','','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','COM_Port','Callback','')
handles.Send_COM=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.6025641,0.4058957,0.2980769,0.1927438],'Relief','default','SliderStep',[0.01,0.1],'String','Ok','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Send_COM','Callback','COM_main(handles)',"callback_type",12)


f.visible = "on";

function COM_main(handles)
global COM_Wait;
COM_Wait=%t;
endfunction
COM_Wait=%f;

while ~COM_Wait
    sleep(50);
end

COM=strtod(handles.COM_Port.string);

//h = openserial(COM,"9600,n,8,1"); //Abertura daserial
tic()

clf;
close;

f=figure('figure_position',[437,209],'figure_size',[640,457],'auto_resize','on','background',[34],'figure_name','Janela gráfica número %d','color_map',[0,0,0;0,0,1;0,1,0;0,1,1;1,0,0;1,0,1;1,1,0;1,1,1;0,0,0.5647059;0,0,0.6901961;0,0,0.8156863;0.5294118,0.8078431,1;0,0.5647059,0;0,0.6901961,0;0,0.8156863,0;0,0.5647059,0.5647059;0,0.6901961,0.6901961;0,0.8156863,0.8156863;0.5647059,0,0;0.6901961,0,0;0.8156863,0,0;0.5647059,0,0.5647059;0.6901961,0,0.6901961;0.8156863,0,0.8156863;0.5019608,0.1882353,0;0.627451,0.2509804,0;0.7529412,0.3764706,0;1,0.5019608,0.5019608;1,0.627451,0.627451;1,0.7529412,0.7529412;1,0.8784314,0.8784314;1,0.8431373,0;0.8,0.8,0.8;0.9333333,0.9333333,0.9333333],'dockable','off','infobar_visible','off','toolbar_visible','off','menubar_visible','off','default_axes','on','visible','off');
//////////
handles.dummy = 0;
handles.Pause=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0180769,0.015933,0.2564103,0.1339713],'Relief','default','SliderStep',[0.01,0.1],'String','Stop','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Pause','Callback','pause_main(handles)',"callback_type",12)
handles.Exit=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7188462,0.0182775,0.2560256,0.1331579],'Relief','default','SliderStep',[0.01,0.1],'String','Exit','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Exit','Callback','exit_main(handles)',"callback_type",12)
handles.Resume=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.2860256,0.0167464,0.2580128,0.1339713],'Relief','default','SliderStep',[0.01,0.1],'String','Start','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Resume','Callback','resume_main(handles)',"callback_type",12)
handles.rpm_signal=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[32],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.0416667,0.1818182,0.4695513,0.2320574],'Relief','default','SliderStep',[0.01,0.1],'String','','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','rpm_signal','Callback','')
handles.send_signal=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5641026,0.2368421,0.2083333,0.1291866],'Relief','default','SliderStep',[0.01,0.1],'String','Send','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','send_signal','Callback','send(handles)',"callback_type",12)


f.visible = "on";


global sair; global start; global stop; global v; global n; global h; global cont;
cont=1
//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////



function pause_main(handles)
    //Pausa a execução do programa.
    global n; global start;
    start = %t
endfunction


function exit_main(handles)
    //Fecha a porta serial e finaliza a execução do programa.

    global h; global sair; global stop; global start;
    sair = %t
    start = %t
    stop = %t
endfunction


function resume_main(handles)
    //Volta a execução do programa.
    global stop; global sair;
    stop = %t
endfunction


function send(handles)
    //Envia o sinal digitado para o arduino.
    writeserial(h, handles.rpm_signal.string);
endfunction


function writeExcel(tempo,valor)
    celula1=string("A")+string(cont); celula2=string("B")+string(cont);
    xls_SetData(celula1,tempo);xls_SetData(celula2,valor);

endfunction

function openExcel()
    if xls_IsExcelRunning() then;
        xls_RecoverExcel();
        //xls_Save(); 
        xls_Quit();
        xls_NewExcel();
    else;
        xls_NewExcel();
    end;

    xls_AddWorkbook();
    xls_SetVisible(%t);
endfunction

function closeExcel()
    getDate=clock();
    name="Resultado_"+string(getDate(4))+"-"+string(getDate(5))+"_"+string(getDate(3))+"-"+string(getDate(2))+"-"+string(getDate(1))+".csv";
    
    xls_SaveAs(name,);
    xls_Close();
    xls_Quit();
endfunction

openExcel();

sleep(1000);

subplot(2,1,1);
sair=%f;
h = openserial(COM,"9600,n,8,1"); //Abertura daserial
while ~sair
    stop=%f
    start=%f
    while ~stop
        sleep(50);
    end 
    while ~start
        [n,v]=msscanf(readserial(h),"V: %d\n");
        if(n>0) then
            t=toc();
            //printf("Valor = %d\n", v);
            plot([t],[v],"-ro");
            writeExcel(t,v);
            cont=cont+1
        end
        sleep(50);
    end
end
closeserial(h);

closeExcel();
close;
