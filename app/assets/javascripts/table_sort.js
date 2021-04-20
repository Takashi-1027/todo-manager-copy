$(function(){
  $('.table-sortable').sortable({
    axis: 'y',
    items: '.item',

    // Ajaxで並び順のデータをコントローラーに送信
    update(e, ui) {
      let item = ui.item;
      let item_data = item.data();
      let params = { _method: 'put' };
      params['task'] = { row_order_position: item.index() };
      $.ajax({
        type: 'POST',
        url: item_data.model_name,
        dataType: 'json',
        data: params,
      });
    console.log('更新しました');
    console.log('row_orderの値' + String(item.index()) );
    },


    // ドラッグ幅をテーブルに合わせる
    start(e, ui) {
      let cells, tableWidth, widthForEachCell;
      tableWidth = $(this).width();
      cells = ui.item.children('td');
      widthForEachCell = tableWidth / cells.length + 'px';
      return cells.css('width', widthForEachCell);
    },

    // エフェクトを付与
    stop(e, ui) {
      return ui.item.children('td').effect('highlight');
    },
  });
});

