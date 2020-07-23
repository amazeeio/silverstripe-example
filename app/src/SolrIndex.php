<?php
use Firesphere\SolrSearch\Indexes\BaseIndex;
use SilverStripe\CMS\Model\SiteTree;

class mycore extends BaseIndex
{
    public function init(): void
    {
        $this->addClass(SiteTree::class);
        $this->addFulltextField('Title');
        $this->addFulltextField('Content');
        parent::init();
    }

    public function getIndexName()
    {
        return 'mycore';
    }
}