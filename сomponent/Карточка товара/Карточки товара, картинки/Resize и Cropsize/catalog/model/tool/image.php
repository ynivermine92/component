<?php
// *	@copyright	OPENCART.PRO 2011 - 2016.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelToolImage extends Model
{
  public function resize($filename, $width, $height)
  {
    if (!is_file(DIR_IMAGE . $filename) || substr(str_replace('\\', '/', realpath(DIR_IMAGE . $filename)), 0, strlen(DIR_IMAGE)) != DIR_IMAGE) {
      return;
    }

    $extension = pathinfo($filename, PATHINFO_EXTENSION);

    $image_old = $filename;
    $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . (int)$width . 'x' . (int)$height . '.' . $extension;

    if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
      list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);

      if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
        return DIR_IMAGE . $image_old;
      }

      $path = '';

      $directories = explode('/', dirname($image_new));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!is_dir(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }

      if ($width_orig != $width || $height_orig != $height) {
        $image = new Image(DIR_IMAGE . $image_old);
        $image->resize($width, $height);
        $image->save(DIR_IMAGE . $image_new);
      } else {
        copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
      }
    }

    $imagepath_parts = explode('/', $image_new);
    $image_new = implode('/', array_map('rawurlencode', $imagepath_parts));

    if ($this->request->server['HTTPS']) {
      return $this->config->get('config_ssl') . 'image/' . $image_new;
    } else {
      return $this->config->get('config_url') . 'image/' . $image_new;
    }
  }

  // Function to crop an image with given dimensions. What doesn/t fit will be cut off.
  function cropsize($filename, $width, $height)
  {

    if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
      return;
    }

    $info = pathinfo($filename);
    $extension = $info['extension'];

    $old_image = $filename;
    $new_image = 'cache/' . substr($filename, 0, strrpos($filename, '.')) . '-cr-' . $width . 'x' . $height . '.' . $extension;

    if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
      $path = '';

      $directories = explode('/', dirname(str_replace('../', '', $new_image)));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!file_exists(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }

      $image = new Image(DIR_IMAGE . $old_image);
      $image->cropsize($width, $height);
      $image->save(DIR_IMAGE . $new_image);
    }

    /*if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            return HTTPS_IMAGE . $new_image;
        } else {
            return HTTP_IMAGE . $new_image;
        }*/

    if ($this->request->server['HTTPS']) {
      return $this->config->get('config_ssl') . 'image/' . $new_image;
    } else {
      return $this->config->get('config_url') . 'image/' . $new_image;
    }
  }

  // Function to resize image with one given max size.
  function onesize($filename, $maxsize)
  {

    if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
      return;
    }

    $info = pathinfo($filename);
    $extension = $info['extension'];

    $old_image = $filename;
    $new_image = 'cache/' . substr($filename, 0, strrpos($filename, '.')) . '-max-' . $maxsize . '.' . $extension;

    if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
      $path = '';

      $directories = explode('/', dirname(str_replace('../', '', $new_image)));

      foreach ($directories as $directory) {
        $path = $path . '/' . $directory;

        if (!file_exists(DIR_IMAGE . $path)) {
          @mkdir(DIR_IMAGE . $path, 0777);
        }
      }

      $image = new Image(DIR_IMAGE . $old_image);
      $image->onesize($maxsize);
      $image->save(DIR_IMAGE . $new_image);
    }

    /*if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            return HTTPS_IMAGE . $new_image;
        } else {
            return HTTP_IMAGE . $new_image;
        }*/

    if ($this->request->server['HTTPS']) {
      return $this->config->get('config_ssl') . 'image/' . $new_image;
    } else {
      return $this->config->get('config_url') . 'image/' . $new_image;
    }
  }
}