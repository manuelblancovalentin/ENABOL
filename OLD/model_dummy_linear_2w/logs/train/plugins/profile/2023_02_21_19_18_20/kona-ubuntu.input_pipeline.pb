	�-Y�&�?�-Y�&�?!�-Y�&�?	��T��3@��T��3@!��T��3@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�-Y�&�?�
}���?A�!���?YG�`��?*	�G�z�^@2U
Iterator::Model::ParallelMapV2R������?!��4I/(<@)R������?1��4I/(<@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapobHN&n�?!��}�A@)#j��G�?1i���?;@:Preprocessing2F
Iterator::ModelU�wE�?!ʼц�G@)z�m�(�?1��nģ?3@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat=�r�}ǐ?!pJ�ļ*@)W�f�"�?1�b��}6'@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice3��yS�?!�?��ԛ@)3��yS�?1�?��ԛ@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zipp��:ǀ�?!6C.yLJ@)�f��I}y?1c���N@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor��+ٱa?!ql��52�?)��+ٱa?1ql��52�?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
both�Your program is MODERATELY input-bound because 20.0% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t10.5 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9��T��3@IS���T@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	�
}���?�
}���?!�
}���?      ��!       "      ��!       *      ��!       2	�!���?�!���?!�!���?:      ��!       B      ��!       J	G�`��?G�`��?!G�`��?R      ��!       Z	G�`��?G�`��?!G�`��?b      ��!       JCPU_ONLYY��T��3@b qS���T@