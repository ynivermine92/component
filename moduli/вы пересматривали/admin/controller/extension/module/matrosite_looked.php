<?php
class ControllerExtensionModuleMatrositeLooked extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('extension/module/matrosite_looked');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('matrosite_looked', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
		}
		

		$data['breadcrumbs'] = array();
 
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/matrosite_looked', 'token=' . $this->session->data['token'], true)
		);
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_rating'] = $this->language->get('entry_rating');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		$data['action'] = $this->url->link('extension/module/matrosite_looked', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->post['matrosite_looked_status'])) {
			$data['matrosite_looked_status'] = $this->request->post['matrosite_looked_status'];
		} else {
			$data['matrosite_looked_status'] = $this->config->get('matrosite_looked_status');
		}
		
		$result = $this->model_setting_setting->getSetting('matrosite_looked');
		if (isset($this->request->post['matrosite_looked_limit'])) {
			$data['matrosite_looked_limit'] = $this->request->post['matrosite_looked_limit'];
		} elseif (!empty($result)) {
			$data['matrosite_looked_limit'] = $result['matrosite_looked_limit'];
		} else {
			$data['matrosite_looked_limit'] = 4;
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/matrosite/looked', $data));
	}

	protected function validate() {
		
		if (!$this->user->hasPermission('modify', 'extension/module/matrosite_looked')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}