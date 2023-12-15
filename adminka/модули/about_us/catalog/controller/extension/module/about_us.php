<?php

class ControllerExtensionModuleAboutUs extends Controller
{
  public function index($setting)
  {
    $this->load->language('extension/module/about_us');

    $data['text_calculation'] = $this->language->get('text_calculation');

    if ($setting['css']) {
      $data['css'] = html_entity_decode($setting['css'], ENT_QUOTES, 'UTF-8');
    } else {
      $data['css'] = '';
    }

    $data['description'] = array();

    if (isset($setting['module_description'])) {
      $data['title_primary'] = html_entity_decode($setting['title_description'][$this->config->get('config_language_id')]['title_primary']);
      $data['description_primary'] = nl2br($setting['title_description'][$this->config->get('config_language_id')]['description_primary']);

      foreach ($setting['module_description'] as $item) {
        $data['description'][] = array(
          // 'title' => html_entity_decode($item['description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8'),
          'description' => html_entity_decode($item['description'][$this->config->get('config_language_id')]['description'], ENT_QUOTES, 'UTF-8'),
          'position' => $item['position'],
          'image' => isset($item['image']) ? 'image/' . $item['image'] : ''
        );
      }

      return $this->load->view('extension/module/about_us', $data);
    }
  }
}
