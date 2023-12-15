<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="tab-pane">
            <ul class="nav nav-tabs" id="language">
              <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-title-primary<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="title_description[<?php echo $language['language_id']; ?>][title_primary]" placeholder="<?php echo $entry_title; ?>" id="input-title-primary<?php echo $language['language_id']; ?>" value="<?php echo isset($title_description[$language['language_id']]['title_primary']) ? $title_description[$language['language_id']]['title_primary'] : ''; ?>" class="form-control" />

                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description-primary<?php echo $language['language_id']; ?>"><?php echo $entry_note; ?></label>
                    <div class="col-sm-10">
                      <textarea name="title_description[<?php echo $language['language_id']; ?>][description_primary]" placeholder="<?php echo $entry_description; ?>" id="input-description-primary<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($title_description[$language['language_id']]['description_primary']) ? $title_description[$language['language_id']]['description_primary'] : ''; ?></textarea>
                    </div>
                  </div>
                </div>
              <?php } ?>
            </div>
          </div>
          <div id="modules">

            <?php $module_row = 0; ?>
            <?php if ($module_description) { ?>
              <?php foreach ($module_description as $item) { ?>

                <fieldset>
                  <div id="module-row<?php echo $module_row; ?>" class="rows">
                    <div class="form-group">
                      <div class="col-sm-11">
                        <div class="tab-pane">
                          <ul class="nav nav-tabs" id="language_<?php echo $module_row; ?>">
                            <legend><?php echo $text_column; ?>#<?php echo $module_row + 1; ?></legend>
                            <?php foreach ($languages as $language) { ?>
                              <li><a href="#language_<?php echo $module_row; ?>_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                              <div class="tab-pane" id="language_<?php echo $module_row; ?>_<?php echo $language['language_id']; ?>">
                                <div class="form-group">
                                  <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                                  <div class="col-sm-10">
                                    <textarea class="form-control summernote" name="module_description[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo $item[0]['description'][$language['language_id']]['description'] ?></textarea>
                                  </div>
                                </div>
                              </div>
                            <?php } ?>
                            <script type="text/javascript">
                              <!--
                              $('#language_<?php echo $module_row; ?> a:first').tab('show');
                              //
                              -->
                            </script>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-1"><button type="button" onclick="$('#module-row<?php echo $module_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div>
                      <label class="col-sm-2 control-label" for="input-image<?php echo $language['language_id']; ?>"><?php echo $entry_image; ?></label>
                      <div class="col-sm-2">
                        <a href="" id="thumb-image<?php echo $module_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $item['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="module_description[<?php echo $module_row; ?>][image]" value="<?php echo $item['image']; ?>" id="input-image<?php echo $module_row; ?>" />
                      </div>
                      <label class="col-sm-2 control-label" for="input-position<?php echo $language['language_id']; ?>"><?php echo $entry_position; ?></label>
                      <div class="col-sm-2">
                        <select name="module_description[<?php echo $module_row; ?>][position]" id="input-position" class="form-control">
                          <option value="0" <?php if ($item['position'] == 0) { ?>selected="selected" <?php } ?>><?php echo $entry_img_up; ?></option>
                          <option value="1" <?php if ($item['position'] == 1) { ?>selected="selected" <?php } ?>><?php echo $entry_img_down; ?></option>
                        </select>
                      </div>
                    </div>
                  </div>
                </fieldset>
                <?php $module_row++; ?>
              <?php } ?>
            <?php } ?>
          </div>
          <div class="rows"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>

            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-css"><?php echo $entry_code_css; ?></label>
              <div class="col-sm-10">
                <textarea name="css" placeholder="<?php echo $entry_description; ?>" id="input-css" class="form-control"><?php echo $css; ?></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-2">
                <select name="status" id="input-status" class="form-control">
                  <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
  <script type="text/javascript">
    <!--
    $('#language a:first').tab('show');

    $('body').on('click', '#modules textarea', function() {
      $(this).summernote({
        height: 100
      });
    })
    //
    -->
  </script>
</div>

<script type="text/javascript">
  <!--
  var module_row = <?php echo $module_row; ?>;

  function addRow() {
    html = '<fieldset>';
    html += '<div id="module-row' + module_row + '" class="rows">';
    html += ' <div class="form-group">';
    html += '  <div class="col-sm-11">';
    html += '    <div class="tab-pane">';
    html += '      <ul class="nav nav-tabs" id="language_' + module_row + '">';
    html += '       <legend><?php echo $text_column; ?>#' + (module_row + 1) + '</legend>';
    <?php foreach ($languages as $language) { ?>
      html += '          <li><a href="#language_' + module_row + '_<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>';
    <?php } ?>
    html += '      </ul>';
    html += '      <div class="tab-content">';
    <?php foreach ($languages as $language) { ?>
      html += '           <div class="tab-pane" id="language_' + module_row + '_<?php echo $language['language_id']; ?>">';
      html += '             <div class="form-group hidden">';
      html += '                <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>';
      html += '                <div class="col-sm-10">';
      html += '                  <input type="text" name="module_description[' + module_row + '][description][<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $entry_title; ?>" id="input-heading<?php echo $language['language_id']; ?>" value="" class="form-control" />';
      html += '                </div>';
      html += '              </div>';
      html += '              <div class="form-group">';
      html += '                <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>';
      html += '                <div class="col-sm-10">';
      html += '                  <textarea class="form-control" name="module_description[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"></textarea>';
      html += '                </div>';
      html += '              </div>';
      html += '            </div>';
    <?php } ?>
    html += '       </div>';
    html += '     </div>';
    html += '   </div>';
    html += '   <div class="col-sm-1">';
    html += '     <button type="button" onclick="$(\'#module-row' + module_row + ', .tooltip\').remove();" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
    html += '   </div>';
    html += '   <label class="col-sm-2 control-label" for="input-image<?php echo $language['language_id']; ?>"><?php echo $entry_image; ?></label>';
    html += '   <div class="col-sm-2">';
    html += '      <a href="" id="thumb-image-' + module_row + '" data-toggle="image" class="img-thumbnail">';
    html += '        <img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />';
    html += '      </a>';
    html += '      <input type="hidden" name="module_description[' + module_row + '][image]" value="" id="input-image' + module_row + '" />';
    html += '   </div>';
    html += '   <label class="col-sm-2 control-label" for="input-position<?php echo $language['language_id']; ?>"><?php echo $entry_position; ?></label>';
    html += '   <div class="col-sm-2">';
    html += '     <select name="module_description[' + module_row + '][position]" id="input-position' + module_row + '" class="form-control">';
    html += '       <option value="0"><?php echo $entry_img_up; ?></option>';
    html += '       <option value="1" ><?php echo $entry_img_down; ?></option>';
    html += '     </select>';
    html += '   </div>';
    html += '  </div>';
    html += ' </fieldset>';

    $('#modules').append(html);
    $('#language_' + module_row + ' a:first').tab('show');
    module_row++;
  }
  //
  -->
</script>
<script src="view/javascript/code/codemirror.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/code/docs.css" />
<script type="text/javascript">
  var editor = CodeMirror.fromTextArea('code', {
    height: "350px",
    parserfile: "parsecss.js",
    stylesheet: "view/javascript/code/csscolors.css",
    path: "view/javascript/code/"
  });
</script>

<style>
  [id*="thumb-image"] img {
    width: 100px;
    height: 100px;
  }
</style>
<?php echo $footer; ?>