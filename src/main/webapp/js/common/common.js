var inGrid = new Object();
inGrid.inGridInit = function (elementId, tableOptions, columns) {
    let inGridElementId = elementId;

    if (document.getElementById(inGridElementId) === null) {
        console.log('init Id Error');
        return;
    }
    inGrid['inGridTableOptions' + inGridElementId] = {
        class: "is-fullwidth is-striped-vertical",
        headerHeight: "35",
        columnHeight: "16",
    }
    Object.assign(inGrid['inGridTableOptions' + inGridElementId], tableOptions);
    inGrid['inGridColumns'+inGridElementId]= new Array(columns.length);
    for(let h=0;h<columns.length;h++){
        inGrid['inGridColumns'+inGridElementId][h]=
            {
                type:"text",
                name:"컬럼명",
                key:"columnKey",
                width:"100",
                align:"center",
                decoration:"none",
                onClick:"",
                readonly:true
            };
        Object.assign(inGrid['inGridColumns'+inGridElementId][h], columns[h]);
    }


    //테이블init
    let inGridTableHtml = '';
    inGridTableHtml += '<table id="inGridTable' + inGridElementId + '" class="table ' + inGrid['inGridTableOptions' + inGridElementId].class + '">\n';
    inGridTableHtml += '	<tbody id="inGridTbody' + inGridElementId + '">\n';
    inGridTableHtml += '	</tbody>\n';
    inGridTableHtml += '</table>';

    $('#' + inGridElementId).html(inGridTableHtml);

    inGrid.inGridColumnInit(inGridElementId, inGrid['inGridColumns' + inGridElementId]);
}

inGrid.inGridColumnInit = function (inGridElementId, inGridColumns) {
    let inGridTableHtml = '';
    let inGridColumncnt;

    let defaultColumnOption = {
        align: "center",
        width: "100"
    };
    inGrid['inGridColumns' + inGridElementId] = inGridColumns;
    inGridColumncnt = inGrid['inGridColumns' + inGridElementId].length;
    inGridTableHtml += '<tr id="inGridHeader' + inGridElementId + '">\n';
    inGridTableHtml += '</tr>\n';
    $('#inGridTbody' + inGridElementId).append(inGridTableHtml);
    for (var j = 0; j < inGrid['inGridColumns' + inGridElementId].length; j++) {
        inGridTableHtml = '';
        inGridTableHtml += '<th id="inGridColumn' + inGridElementId + inGridColumncnt + '" style="width:' + (isEmpty(inGrid['inGridColumns' + inGridElementId][j].width) ? defaultColumnOption.width : inGrid['inGridColumns' + inGridElementId][j].width) + 'px;height:' + inGrid['inGridTableOptions' + inGridElementId].headerHeight + 'px;text-align:' + (isEmpty(inGrid['inGridColumns' + inGridElementId][j].align) ? defaultColumnOption.align : inGrid['inGridColumns' + inGridElementId][j].align) + ';">' + inGrid['inGridColumns' + inGridElementId][j].name + '</th>\n';
        inGridColumncnt++;
        $('#inGridHeader' + inGridElementId).append(inGridTableHtml);
    }

    inGrid.inGridEmptyData(inGridElementId);
}

inGrid.inGridDataInit = function (inGridElementId, inGridData) {
    inGrid.inGridDataClear(inGridElementId);

    let inGridTableHtml = '';
    let inGridDatacnt;

    let inGridEditorMapCnt = 0;
    let inGridEditorMap = new Map();

    let inGridOnclickMapCnt = 0;
    let inGridOnclickMap = new Map();

    inGridDatacnt = inGridData.length;
    for (var i = 0; i < inGridData.length; i++) {

        inGridTableHtml = '';
        inGridTableHtml += '<tr id="inGridData' + inGridElementId + i + '">\n';
        inGridTableHtml += '</tr>\n';
        $('#inGridTbody' + inGridElementId).append(inGridTableHtml);
        for (var c = 0; c < inGrid['inGridColumns' + inGridElementId].length; c++) {
            inGridTableHtml = '';
            if (Object.keys(inGridData[i]).includes(inGrid['inGridColumns' + inGridElementId][c].key)) {
                switch (inGrid['inGridColumns' + inGridElementId][c].type) {

                    case "text" :
                        if (inGrid['inGridColumns' + inGridElementId][c].readonly) {
                            inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'">' + inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key] + '</td>';
                            $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                        } else {
                            inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'"><input value="' + inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key] + '"></td>';
                            $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                        }

                        break;

                    case "template" :
                        if (isJsonString(inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key])) {
                            switch (JSON.parse(inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key]).templateCode) {
                                case "CM100603" :
                                    inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'"><div id="inGridWrapper' + inGridElementId + inGridDatacnt + '"class="inGridWrapper' + inGridElementId + inGridDatacnt + '" style="display: none;"><div style="height:fit-content" id="inGridEditorContainer' + inGridElementId + inGridDatacnt + '"></div></div></td>'
                                    $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                                    inGridEditorMap.set(inGridEditorMapCnt, {
                                        readonly: inGrid['inGridColumns' + inGridElementId][c].readonly,
                                        dataKey: inGridDatacnt,
                                        dataValue: JSON.stringify(inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key])
                                    });
                                    inGridEditorMapCnt++;
                                    break;

                                case "text" :
                                    inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'">' + inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key] + '</td>';
                                    $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                                    break;
                                default :
                                    inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'">' + inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key] + '</td>';
                                    $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                                    break;
                            }
                        } else {
                            inGridTableHtml += '<td id="inGridData' + inGridElementId + i +'_'+ c + '" style="height:' + inGrid['inGridTableOptions' + inGridElementId].columnHeight + 'px;text-align:' + inGrid['inGridColumns' + inGridElementId][c].align + ';text-decoration:'+ inGrid['inGridColumns' + inGridElementId][c].decoration +'">' + inGridData[i][inGrid['inGridColumns' + inGridElementId][c].key] + '</td>';
                            $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
                            console.log(inGridDatacnt + 'Not available JSON Parser Template');
                        }
                        break;

                    default :

                        console.log(inGridDatacnt + 'ColumnTypeError');
                        return;
                }
            } else {
                inGridTableHtml += '<td></td>';
                $('#inGridData' + inGridElementId + i).append(inGridTableHtml);
            }

            if(inGrid['inGridColumns' + inGridElementId][c].onClick instanceof Function){
                inGridOnclickMap.set(inGridOnclickMapCnt, {
                    id:'inGridData' + inGridElementId + i +'_'+ c,
                    dataKey:c,
                    row: inGridData[i]
                });
                inGridOnclickMapCnt++
            }
        }
        inGridDatacnt++;

    }

    inGrid.inGridOnClickBuilder(inGridElementId,inGridOnclickMap);


    inGrid.inGridDataTemplateBuilder(inGridElementId, inGridEditorMap);

}

inGrid.inGridOnClickBuilder = function(inGridElementId,inGridOnclickMap){
    for(let o=0;o<inGridOnclickMap.size;o++){
        document.getElementById(inGridOnclickMap.get(o).id).addEventListener("click",function e(){return inGrid['inGridColumns' + inGridElementId][inGridOnclickMap.get(o).dataKey].onClick.call(this,inGridOnclickMap.get(o));});
        document.getElementById(inGridOnclickMap.get(o).id).style.cursor='pointer';
    }
}

inGrid.inGridDataClear = function (inGridElementId) {
    $("#inGridTbody" + inGridElementId + " tr[id^='inGridData']").remove();
}

inGrid.inGridEmptyData = function (inGridElementId) {
    let inGridTableHtml = '';
    $("#inGridTbody" + inGridElementId + " tr[id^='inGridData']").remove();
    inGridTableHtml += '<tr id="inGridData' + inGridElementId + 0 + '">\n';
    inGridTableHtml += '<td colspan="'+inGrid['inGridColumns' + inGridElementId].length+'" style="height:80px;text-align:center;">' +  ' No data. ' + '</td>';
    inGridTableHtml += '</tr>\n';
    $('#inGridTbody' + inGridElementId).append(inGridTableHtml);
}

inGrid.inGridDataTemplateBuilder = function (inGridElementId, inGridEditorMap) {
    if (inGridEditorMap.size > 0) {
        for (var editor = 0; editor < inGridEditorMap.size; editor++) {
            let quill = new Quill('#inGridEditorContainer' + inGridElementId + inGridEditorMap.get(editor).dataKey, {
                theme: 'snow'
            });

            let target = {
                wrapId: 'inGridWrapper' + inGridElementId + inGridEditorMap.get(editor).dataKey,
                editor: quill
            };

            applyTemplateV2(target, JSON.parse(inGridEditorMap.get(editor).dataValue), TEMPLATE_TYPE.editor, 'inGridWrapper' + inGridElementId + inGridEditorMap.get(editor).dataKey, {readOnly: inGridEditorMap.get(editor).readonly});
            quill.container.style.backgroundColor = '#FFFFFF';
            quill.editor.scroll.domNode.style.minHeight='0px'
            quill.editor.scroll.domNode.style.height = 'fit-content';
        }
    }
}

inGrid.inGridLoad = function(inGridElementId,dataSource){
    let url = dataSource.api.readData.url;
    let param = dataSource.api.readData.initParams;
    $.get(url, param, function(data) {
        if(data.length > 0){
            inGrid.inGridDataInit(inGridElementId,data);
        }
        data = null;
    });
}

