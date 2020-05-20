<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;

/**
 * Class ApplicationType
 * @package App\Form
 */
class ApplicationType extends AbstractType{

    /**
     * Permet d'avoir un tableau
     * @param $label
     * @param $placeholder
     * @param array $options
     * @return array
     */
    protected function getConfiguration($label, $placeholder, $options = []) {

        $array = array_merge_recursive([
            'label' => $label,
            'attr' => [
                'placeholder' => $placeholder
            ]], $options);
        return $array;
    }


}