	�����?�����?!�����?	+,�f7�8@+,�f7�8@!+,�f7�8@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$�����?3P�>�?A��;�(A�?Y�[ A�c�?*	�S㥛<]@2U
Iterator::Model::ParallelMapV2M.��:��?!e�͆��C@)M.��:��?1e�͆��C@:Preprocessing2F
Iterator::Model��a��4�?!�h���	P@)C7�嶝?1M��t�8@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapc�0���?!�0�g�]7@)�l��p�?1^A�N��4@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat7�Ӂ���?!�VE, �"@)_���:T�?1'(�M$ @:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip>@���v�?!v.�j�A@)�ם�<�l?1p+@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice�uX�f?!5{'�(@)�uX�f?15{'�(@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor��ฌ�Z?!Av9��7�?)��ฌ�Z?1Av9��7�?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis�
host�Your program is HIGHLY input-bound because 24.7% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*moderate2s8.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9+,�f7�8@I��D&r�R@Zno>Look at Section 3 for the breakdown of input time on the host.B�
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown�
	3P�>�?3P�>�?!3P�>�?      ��!       "      ��!       *      ��!       2	��;�(A�?��;�(A�?!��;�(A�?:      ��!       B      ��!       J	�[ A�c�?�[ A�c�?!�[ A�c�?R      ��!       Z	�[ A�c�?�[ A�c�?!�[ A�c�?b      ��!       JCPU_ONLYY+,�f7�8@b q��D&r�R@